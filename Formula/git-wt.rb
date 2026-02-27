class GitWt < Formula
  desc "Fast CLI tool for managing git worktrees with enhanced features"
  homepage "https://github.com/shhac/git-wt"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-wt/releases/download/v0.6.0/git-wt-aarch64-macos.tar.gz"
      sha256 "831427e8ae5d3fb6616024c0584f7fcf4468424c0e603797c6e093c1a34e3d67"
    end
    on_intel do
      url "https://github.com/shhac/git-wt/releases/download/v0.6.0/git-wt-x86_64-macos.tar.gz"
      sha256 "ed7922f493e5c7e613f835be0767ac0ad01eba0319694b3cc4d7fd39471829ff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-wt/releases/download/v0.6.0/git-wt-aarch64-linux.tar.gz"
      sha256 "9c3a0cc655f3054450067a821faacb259592f5bc1282aa0ba442a8dc7a4f15b7"
    end
    on_intel do
      url "https://github.com/shhac/git-wt/releases/download/v0.6.0/git-wt-x86_64-linux.tar.gz"
      sha256 "d2771f4ab326e7273ae953e78b21e162a5c3fc5062ceae90d8219a949fe50003"
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
      Without the alias, git-wt outputs paths for scripting:
        cd "$(git-wt go feature-branch)"
    EOS
  end

  test do
    assert_match "git-wt version 0.6.0", shell_output("#{bin}/git-wt --version")
    assert_match "worktree", shell_output("#{bin}/git-wt --help")
  end
end
