class GitWt < Formula
  desc "Fast CLI for managing git worktrees with enhanced features"
  homepage "https://github.com/shhac/git-wt"
  version "0.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-wt/releases/download/v0.10.0/git-wt-darwin-arm64.tar.gz"
      sha256 "6bf071ef1ddf4a417cf3f1917fb4ef8b69a2a817ce2b3938f7b557eaf0144c00"
    end
    on_intel do
      url "https://github.com/shhac/git-wt/releases/download/v0.10.0/git-wt-darwin-amd64.tar.gz"
      sha256 "e2fbcb4a4bbffb15d0b7b6b5e988ac92cdbbd38cf5256b6b002c48be98f9d33f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-wt/releases/download/v0.10.0/git-wt-linux-arm64.tar.gz"
      sha256 "9b0394cbd0047c94bb5e50478cc09dcacafc0b50f8940379cb5d55b2e91cf4d2"
    end
    on_intel do
      url "https://github.com/shhac/git-wt/releases/download/v0.10.0/git-wt-linux-amd64.tar.gz"
      sha256 "cb78011112128fcedb84b4290db4cb95fb64a1b85323036f28b26f7522158af6"
    end
  end

  def install
    bin.install "git-wt"
  end

  def caveats
    <<~EOS
      Enable shell integration so `gwt go` / `gwt new` change directory:

        # zsh (~/.zshrc) or bash (~/.bashrc)
        eval "$(git-wt alias gwt)"

      Then restart your shell or `source` your rc file.

      Without the alias the binary still works in scripts:
        cd "$(git-wt go feature-branch)"
    EOS
  end

  test do
    assert_match "git-wt version 0.10.0", shell_output("#{bin}/git-wt --version")
    assert_match "worktree", shell_output("#{bin}/git-wt --help")
  end
end
