class GitWt < Formula
  desc "Fast CLI for managing git worktrees with enhanced features"
  homepage "https://github.com/shhac/git-wt"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-wt/releases/download/v0.8.0/git-wt-darwin-arm64.tar.gz"
      sha256 "f0ad906e816e85c4a852cdae0951ae1be04c498dfc25731c2d502f4301e43d44"
    end
    on_intel do
      url "https://github.com/shhac/git-wt/releases/download/v0.8.0/git-wt-darwin-amd64.tar.gz"
      sha256 "1815e1263a1dbeb19aa509696401c1f05559871a5064424b15cf5e010fbca9cc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-wt/releases/download/v0.8.0/git-wt-linux-arm64.tar.gz"
      sha256 "8a48965de18123517dcb58f3f92c2bd50a63b26a11ba407a7934f371ae2b54d1"
    end
    on_intel do
      url "https://github.com/shhac/git-wt/releases/download/v0.8.0/git-wt-linux-amd64.tar.gz"
      sha256 "b045fdb50b3d645b0b7eb69291d15159051a7a6a9e6040f97ed9ae7c6d7fb7eb"
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
    assert_match "git-wt version 0.8.0", shell_output("#{bin}/git-wt --version")
    assert_match "worktree", shell_output("#{bin}/git-wt --help")
  end
end
