#!/usr/bin/env bash
#
# Release download counts for the tools in this tap, as a proxy for installs.
#
# Homebrew publishes analytics only for homebrew/core and homebrew/cask, so for a
# third-party tap the closest available signal is how often each release tarball
# was fetched from GitHub. One download roughly equals one `brew install` or
# `brew upgrade` on a machine that had not seen that version before.
#
# Requires: gh (authenticated), jq

set -euo pipefail

MIN_LIVE_DAYS=0
RECENT=0
ACTIVE_ONLY=0
INCLUDE_PRERELEASE=0
FORMAT=table
SORT_KEY=mean
JOBS=6

usage() {
  cat <<'USAGE'
Usage: scripts/download-stats.sh [options] [name...]

Counts GitHub release asset downloads for each formula and cask in this tap.
With no names, every formula and cask is included.

Options:
  -m, --min-live DAYS  Only count releases that stood as latest for at least
                       DAYS before being superseded (the current release always
                       qualifies). Filters out burst-shipped versions that no
                       user had a chance to install. Default: 0.
  -n, --recent N       Only the N most recent qualifying releases per tool.
                       Default: 0 (all).
  -a, --active-only    Skip releases with zero downloads.
  -p, --prereleases    Include prereleases. Default: excluded.
  -s, --sort KEY       Sort by name, total, used, median, mean, or latest.
                       Default: mean.
  -j, --json           Emit JSON instead of a table.
  -h, --help           Show this help.

Columns:
  RELS    published, non-draft releases found
  USED    of those, how many passed the filters and were counted
  TOTAL   summed asset downloads across counted releases
  MEDIAN  per-release downloads, middle value (trust this over MEAN)
  MEAN    per-release downloads, average
  LATEST  downloads of the newest counted release

Caveats:
  Downloads are cumulative and never reset, so an older release has had longer
  to accumulate stragglers than a recent one. Counts include your own installs
  and any CI, so treat roughly 1 per release as baseline noise. Draft releases
  are always excluded.

Examples:
  scripts/download-stats.sh
  scripts/download-stats.sh --min-live 2 --sort median
  scripts/download-stats.sh --min-live 2 --recent 5 git-hunk toss
  scripts/download-stats.sh --json > stats.json
USAGE
}

die() { printf 'error: %s\n' "$*" >&2; exit 1; }

while [ $# -gt 0 ]; do
  case "$1" in
    -m|--min-live)   MIN_LIVE_DAYS=${2:?--min-live needs a value}; shift 2 ;;
    -n|--recent)     RECENT=${2:?--recent needs a value}; shift 2 ;;
    -a|--active-only) ACTIVE_ONLY=1; shift ;;
    -p|--prereleases) INCLUDE_PRERELEASE=1; shift ;;
    -s|--sort)       SORT_KEY=${2:?--sort needs a value}; shift 2 ;;
    -j|--json)       FORMAT=json; shift ;;
    -h|--help)       usage; exit 0 ;;
    --)              shift; break ;;
    -*)              die "unknown option: $1 (try --help)" ;;
    *)               break ;;
  esac
done

case "$SORT_KEY" in
  name|total|used|median|mean|latest) ;;
  *) die "invalid --sort key: $SORT_KEY (try --help)" ;;
esac
[[ $MIN_LIVE_DAYS =~ ^[0-9]+([.][0-9]+)?$ ]] || die "--min-live must be a number"
[[ $RECENT =~ ^[0-9]+$ ]] || die "--recent must be an integer"

command -v gh >/dev/null || die "gh is required: https://cli.github.com"
command -v jq >/dev/null || die "jq is required"

cd "$(dirname "${BASH_SOURCE[0]}")/.."

# Resolve each formula/cask to the GitHub repo it downloads release assets from.
# The download URL is more reliable than `homepage`, since that is what actually
# serves the artifacts we are counting.
targets=()
for f in Formula/*.rb Casks/*.rb; do
  [ -e "$f" ] || continue
  name=$(basename "$f" .rb)
  if [ $# -gt 0 ]; then
    match=0
    for want in "$@"; do [ "$want" = "$name" ] && match=1; done
    [ $match -eq 1 ] || continue
  fi
  repo=$(grep -om1 'github\.com/[^/"]\+/[^/"]\+/releases' "$f" | sed -E 's#github\.com/([^/]+/[^/]+)/releases#\1#') || true
  [ -z "${repo:-}" ] && repo=$(grep -m1 '^\s*homepage' "$f" | sed -nE 's#.*github\.com/([^/"]+/[^/"]+).*#\1#p') || true
  if [ -z "${repo:-}" ]; then
    printf 'skipping %s: no github repo found\n' "$name" >&2
    continue
  fi
  targets+=("$name $repo")
done

[ ${#targets[@]} -gt 0 ] || die "no matching formulae or casks"

min_live_seconds=$(awk -v d="$MIN_LIVE_DAYS" 'BEGIN{printf "%d", d * 86400}')
now=$(date -u +%s)
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

fetch_one() {
  local name=$1 repo=$2
  gh api "repos/$repo/releases" --paginate --jq '
      .[]
      | select(.draft | not)
      | { t: (.published_at | fromdateiso8601),
          pre: .prerelease,
          n: ([.assets[] | select(.name | test("\\.(tar\\.gz|tgz|zip|pkg|dmg)$")) | .download_count] | add // 0) }
    ' 2>/dev/null \
  | jq -s \
      --arg name "$name" --arg repo "$repo" \
      --argjson now "$now" --argjson minLive "$min_live_seconds" \
      --argjson recent "$RECENT" --argjson activeOnly "$ACTIVE_ONLY" \
      --argjson withPre "$INCLUDE_PRERELEASE" '
      (if $withPre == 1 then . else map(select(.pre | not)) end)
      | sort_by(-.t) as $rel
      # A release is "live" from its publish until the next one supersedes it.
      | [ range(0; $rel | length) as $i
          | $rel[$i] + { life: (if $i == 0 then ($now - $rel[$i].t)
                                else ($rel[$i - 1].t - $rel[$i].t) end) } ]
      | map(select(.life >= $minLive))
      | (if $activeOnly == 1 then map(select(.n > 0)) else . end)
      | (if $recent > 0 then .[0:$recent] else . end) as $used
      | ($used | map(.n) | sort) as $ns
      | { name: $name,
          repo: $repo,
          rels: ($rel | length),
          used: ($ns | length),
          total: ($ns | add // 0),
          median: (if ($ns | length) == 0 then 0
                   elif ($ns | length) % 2 == 1 then $ns[($ns | length) / 2 | floor]
                   else (($ns[($ns | length) / 2 - 1] + $ns[($ns | length) / 2]) / 2) end),
          mean: (if ($ns | length) == 0 then 0
                 else (($ns | add) / ($ns | length) * 10 | round / 10) end),
          latest: ($used[0].n // 0) }
    ' > "$tmp/$name.json"
}
export -f fetch_one
export now min_live_seconds RECENT ACTIVE_ONLY INCLUDE_PRERELEASE tmp

# Names and repo slugs never contain spaces, so -n 2 splits each pair cleanly.
printf '%s\n' "${targets[@]}" \
  | xargs -P "$JOBS" -n 2 bash -c 'fetch_one "$0" "$1"'

results=$(cat "$tmp"/*.json | jq -s --arg key "$SORT_KEY" '
  if $key == "name" then sort_by(.name) else sort_by(.[$key]) | reverse end')

if [ "$FORMAT" = json ]; then
  printf '%s\n' "$results"
  exit 0
fi

printf '%-22s %5s %5s %7s %7s %7s %7s\n' FORMULA RELS USED TOTAL MEDIAN MEAN LATEST
printf '%s\n' "$results" | jq -r '.[] | [.name, .rels, .used, .total, .median, .mean, .latest] | @tsv' \
  | awk -F'\t' '{printf "%-22s %5s %5s %7s %7s %7s %7s\n", $1, $2, $3, $4, $5, $6, $7}
                {t += $4} END {printf "%-22s %5s %5s %7s\n", "TOTAL", "", "", t}'
