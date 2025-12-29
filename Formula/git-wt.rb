class GitWt < Formula
  desc "Fast CLI tool for managing git worktrees with enhanced features"
  homepage "https://github.com/shhac/git-wt"
  version "0.4.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-wt/releases/download/v0.4.3/git-wt-aarch64-macos.tar.gz"
      sha256 "57868a05b1b30eb322871e4bc9866aac53e37a68ddfc8fe628681e1d07c7bce8"
    end
    on_intel do
      url "https://github.com/shhac/git-wt/releases/download/v0.4.3/git-wt-x86_64-macos.tar.gz"
      sha256 "919f44d7176a5578cd522e12fe44a17f542ff97b074720132fa02baaf7c1a720"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-wt/releases/download/v0.4.3/git-wt-aarch64-linux.tar.gz"
      sha256 "834e6e515f05d90e9fff8cdd348dd98d3db3107a1d1c910fd09140855c61e8b1"
    end
    on_intel do
      url "https://github.com/shhac/git-wt/releases/download/v0.4.3/git-wt-x86_64-linux.tar.gz"
      sha256 "c6dd5f9a0027c0fc942ac953ebf69d03085485d2c61eedf58f8cba26b7b98e8c"
    end
  end

  def install
    bin.install "git-wt"
  end

  def caveats
    <<~EOS
      To enable shell integration for directory navigation, add to your shell config:

        # For zsh (~/.zshrc)
        eval "$(git-wt alias gwt)"

        # For bash (~/.bashrc)
        eval "$(git-wt alias gwt)"

      Then restart your shell or run: source ~/.zshrc (or ~/.bashrc)

      This creates the `gwt` alias for commands that change directories.
    EOS
  end

  test do
    # --version and --help output to stderr
    assert_match "git-wt version 0.4.3", shell_output("#{bin}/git-wt --version 2>&1")
    assert_match "worktree", shell_output("#{bin}/git-wt --help 2>&1")
  end
end
