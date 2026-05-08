class GitWt < Formula
  desc "Fast CLI for managing git worktrees with enhanced features"
  homepage "https://github.com/shhac/git-wt"
  version "0.7.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-wt/releases/download/v0.7.1/git-wt-darwin-arm64.tar.gz"
      sha256 "dd136fdb19d425e4f0c62e440f03c77f05c261adc90ddd136ade0267f47a1e2a"
    end
    on_intel do
      url "https://github.com/shhac/git-wt/releases/download/v0.7.1/git-wt-darwin-amd64.tar.gz"
      sha256 "64649924a822e3677d70e4c38366e2f46b78ad46be8031276b046b48d33cbf28"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-wt/releases/download/v0.7.1/git-wt-linux-arm64.tar.gz"
      sha256 "df800469ce4ab0a25294a2df89977fe37921da79c960ae3887618939bd9193c4"
    end
    on_intel do
      url "https://github.com/shhac/git-wt/releases/download/v0.7.1/git-wt-linux-amd64.tar.gz"
      sha256 "20b4a2e6ed324165e41af4e365689d8ef58e0b47a0e2f6b5cb0680c7ce071193"
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
    assert_match "git-wt version 0.7.1", shell_output("#{bin}/git-wt --version")
    assert_match "worktree", shell_output("#{bin}/git-wt --help")
  end
end
