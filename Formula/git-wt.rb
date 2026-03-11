class GitWt < Formula
  desc "Fast CLI tool for managing git worktrees with enhanced features"
  homepage "https://github.com/shhac/git-wt"
  version "0.6.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-wt/releases/download/v0.6.2/git-wt-aarch64-macos.tar.gz"
      sha256 "46579cb23af35c7cba87adedea4b8ed7e92d9d980e9454433a4b8b4ab03d34ed"
    end
    on_intel do
      url "https://github.com/shhac/git-wt/releases/download/v0.6.2/git-wt-x86_64-macos.tar.gz"
      sha256 "38a1be19611cc880f9b8ccfdd89b99e8ff45d5b5fb2847af3ff6fc4210b23ca6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-wt/releases/download/v0.6.2/git-wt-aarch64-linux.tar.gz"
      sha256 "43ee9abd28cd4b465879cbcd9d0c4c2b3309438fe8d5febe4de0496efc7b534d"
    end
    on_intel do
      url "https://github.com/shhac/git-wt/releases/download/v0.6.2/git-wt-x86_64-linux.tar.gz"
      sha256 "f4a4f61e821224a410c8feff64abd814411a65dfd51c03e44e514b566ad3d8bb"
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
    assert_match "git-wt version 0.6.2", shell_output("#{bin}/git-wt --version")
    assert_match "worktree", shell_output("#{bin}/git-wt --help")
  end
end
