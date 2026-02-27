class GitWt < Formula
  desc "Fast CLI tool for managing git worktrees with enhanced features"
  homepage "https://github.com/shhac/git-wt"
  version "0.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-wt/releases/download/v0.6.1/git-wt-aarch64-macos.tar.gz"
      sha256 "05ccf0ad0276285c4bc236b1b5cb9bf94e7ceeaf5d6fe1f9d06c91b3b64c2e8f"
    end
    on_intel do
      url "https://github.com/shhac/git-wt/releases/download/v0.6.1/git-wt-x86_64-macos.tar.gz"
      sha256 "a1c7232d987767a67d30ce8114e908baa06c9a906f9e191e4c59bcfedfd8264f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-wt/releases/download/v0.6.1/git-wt-aarch64-linux.tar.gz"
      sha256 "4c5ad5373fa3bcc4a247fe4ecb25049c6cf1602d6111730c2c0a82f206bee49d"
    end
    on_intel do
      url "https://github.com/shhac/git-wt/releases/download/v0.6.1/git-wt-x86_64-linux.tar.gz"
      sha256 "b463020266fbbed50f05a4fd18a3000897e3f2454cb1a711093bfec97c8073c7"
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
    assert_match "git-wt version 0.6.1", shell_output("#{bin}/git-wt --version")
    assert_match "worktree", shell_output("#{bin}/git-wt --help")
  end
end
