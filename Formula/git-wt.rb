class GitWt < Formula
  desc "Fast CLI for managing git worktrees with enhanced features"
  homepage "https://github.com/shhac/git-wt"
  version "0.8.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-wt/releases/download/v0.8.2/git-wt-darwin-arm64.tar.gz"
      sha256 "2f9c7d63dd5faa4dc2df2c4661de7e5c49e174ca70259361eb478fabe70316c7"
    end
    on_intel do
      url "https://github.com/shhac/git-wt/releases/download/v0.8.2/git-wt-darwin-amd64.tar.gz"
      sha256 "e8281368af7dc0c9d798eb6768f45f1243c278fd0a669f9d4a636a3b4d67d376"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-wt/releases/download/v0.8.2/git-wt-linux-arm64.tar.gz"
      sha256 "6c1bb0ab5b394caab37e6e69e5fa4351d5d98a1735ae936ff9f95940a55b1eb4"
    end
    on_intel do
      url "https://github.com/shhac/git-wt/releases/download/v0.8.2/git-wt-linux-amd64.tar.gz"
      sha256 "0219b966bf6011c532c0ec5c36bb22441d5129822d7af66ceb5afb6c1b5edd7d"
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
    assert_match "git-wt version 0.8.2", shell_output("#{bin}/git-wt --version")
    assert_match "worktree", shell_output("#{bin}/git-wt --help")
  end
end
