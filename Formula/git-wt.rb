class GitWt < Formula
  desc "Fast CLI tool for managing git worktrees with enhanced features"
  homepage "https://github.com/shhac/git-wt"
  version "0.4.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-wt/releases/download/v0.4.4/git-wt-aarch64-macos.tar.gz"
      sha256 "2090fd306d67db7b0a70babebbeda6c7a8c361ba89d1aded3cefc71ae4887a8b"
    end
    on_intel do
      url "https://github.com/shhac/git-wt/releases/download/v0.4.4/git-wt-x86_64-macos.tar.gz"
      sha256 "0e833574fe0081ec0e4bf1d936fa398db8353a8672387336ff4c2e2d33148669"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-wt/releases/download/v0.4.4/git-wt-aarch64-linux.tar.gz"
      sha256 "3e9e8db464ff9343c59e755d43c7909064a1e7718e1c5e558138bb08c683a517"
    end
    on_intel do
      url "https://github.com/shhac/git-wt/releases/download/v0.4.4/git-wt-x86_64-linux.tar.gz"
      sha256 "453a1374dbd543c52fe06c2c7dc165ac1fd2a51cff84b9d40adb24dccb699d30"
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
    assert_match "git-wt version 0.4.4", shell_output("#{bin}/git-wt --version 2>&1")
    assert_match "worktree", shell_output("#{bin}/git-wt --help 2>&1")
  end
end
