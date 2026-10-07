# Homebrew Tap

Personal Homebrew tap for distributing custom CLI tools.

## Installation

```bash
brew tap shhac/tap
```

## Available Formulas

| Formula | Description |
|---------|-------------|
| [agent-cloudflare](https://github.com/shhac/agent-cloudflare) | Cloudflare operations CLI for AI agents |
| [agent-dd](https://github.com/shhac/agent-dd) | Datadog triage CLI for AI agents |
| [agent-deepweb](https://github.com/shhac/agent-deepweb) | Authenticated HTTP CLI for AI agents (curl-with-auth) |
| [agent-dlocal](https://github.com/shhac/agent-dlocal) | Triage CLI for dLocal payments, built for AI agents |
| [agent-fathom](https://github.com/shhac/agent-fathom) | Fathom meeting intelligence CLI for AI agents |
| [agent-incident](https://github.com/shhac/agent-incident) | Triage CLI for incident.io, built for AI agents |
| [agent-mcp-host](https://github.com/shhac/agent-mcp-host) | One-origin MCP host for the agent-* CLI family |
| [agent-mongo](https://github.com/shhac/agent-mongo) | Read-only MongoDB CLI for AI agents |
| [agent-motion](https://github.com/shhac/agent-motion) | Temporal video analysis CLI for AI agents |
| [agent-notion](https://github.com/shhac/agent-notion) | Notion CLI for humans and LLMs |
| [agent-posthog](https://github.com/shhac/agent-posthog) | PostHog product analytics CLI for AI agents |
| [agent-postmark](https://github.com/shhac/agent-postmark) | Postmark delivery triage CLI for AI agents |
| [agent-slack](https://github.com/shhac/agent-slack) | Slack CLI for AI agents |
| [agent-sql](https://github.com/shhac/agent-sql) | Read-only SQL CLI for AI agents |
| [agent-statsig](https://github.com/shhac/agent-statsig) | Statsig feature flag CLI for AI agents |
| [agent-stripe](https://github.com/shhac/agent-stripe) | Stripe incident triage CLI for AI agents |
| [agent-vercel](https://github.com/shhac/agent-vercel) | Vercel CLI for AI agents |
| [crew-assistant](https://github.com/shhac/crew-assistant) | Personal AI assistant for coordinating project agents |
| [crew-code-review](https://github.com/shhac/crew-code-review) | PR review queue + scheduler for AI agents |
| [g2g](https://github.com/shhac/g2g) | Manage stacked branches and project them onto GitHub native stacks |
| [git-hunk](https://github.com/shhac/git-hunk) | Non-interactive CLI for staging git diff hunks by content hash |
| [git-wt](https://github.com/shhac/git-wt) | Fast CLI for managing git worktrees with enhanced features |
| [lin](https://github.com/shhac/lin) | Linear CLI for humans and LLMs |
| [prtea](https://github.com/shhac/prtea) | TUI for reviewing GitHub pull requests |
| [toss](https://github.com/shhac/toss) | Fast dice rolling CLI with colored output and reproducible rolls |

## Available Casks

| Cask | Description |
|------|-------------|
| [grotto](https://github.com/shhac/grotto) | Permissive, user-friendly gRPC client |

## Usage

Install a formula:

```bash
brew install shhac/tap/git-hunk
```

Or after tapping:

```bash
brew install git-hunk
```

Install a cask (macOS only):

```bash
brew install --cask shhac/tap/grotto
```

Check installed versions with `brew info <formula>`.

## Renamed Formulas

These formulas were renamed. `brew upgrade` moves existing installs to the new name automatically.

| Old name | New name |
|----------|----------|
| gt2gh | g2g |
| agent-assistant | crew-assistant |
| agent-code-review | crew-code-review |

## Platform Support

All formulas support:
- macOS (Apple Silicon & Intel)
- Linux (ARM64 & x86_64)

Casks are macOS only (Apple Silicon & Intel).
