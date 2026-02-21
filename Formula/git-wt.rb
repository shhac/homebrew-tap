class GitWt < Formula
  desc "Fast CLI tool for managing git worktrees with enhanced features"
  homepage "https://github.com/shhac/git-wt"
  version "0.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-wt/releases/download/v0.5.1/git-wt-aarch64-macos.tar.gz"
      sha256 "89617432fe9dcf31141baa51e116327f60540b39d6b92c70e78aca0aaceb72cf"
    end
    on_intel do
      url "https://github.com/shhac/git-wt/releases/download/v0.5.1/git-wt-x86_64-macos.tar.gz"
      sha256 "c950a17a30f921c16aba181b39a754f5d3d5544a638ff817363848a01511caf1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-wt/releases/download/v0.5.1/git-wt-aarch64-linux.tar.gz"
      sha256 "9d501748f77a4532fd50c83abbc3c5f43695e0d37d8d5c7d8e40ec0e67c281cc"
    end
    on_intel do
      url "https://github.com/shhac/git-wt/releases/download/v0.5.1/git-wt-x86_64-linux.tar.gz"
      sha256 "24fbbd0c6854005ad45aa5b9170d442808dae93c86531bed85f8f5ec5b9a344d"
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
    assert_match "git-wt version 0.5.1", shell_output("#{bin}/git-wt --version")
    assert_match "worktree", shell_output("#{bin}/git-wt --help")
  end
end
