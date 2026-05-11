class GitWt < Formula
  desc "Fast CLI for managing git worktrees with enhanced features"
  homepage "https://github.com/shhac/git-wt"
  version "0.8.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-wt/releases/download/v0.8.1/git-wt-darwin-arm64.tar.gz"
      sha256 "4028e370659c89744141830db3e7d48c9cabfa36fac9fd3e0a611a1d6e7256e1"
    end
    on_intel do
      url "https://github.com/shhac/git-wt/releases/download/v0.8.1/git-wt-darwin-amd64.tar.gz"
      sha256 "0dfea1fd8cd1b1a22434f2f440a35abe52a3c4b94fd354eacea97b47ed88973e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-wt/releases/download/v0.8.1/git-wt-linux-arm64.tar.gz"
      sha256 "3e4705a3dda7b69c836ca88c11e31e9ea6e7d41b26cc47a20addf0bb0ba018ef"
    end
    on_intel do
      url "https://github.com/shhac/git-wt/releases/download/v0.8.1/git-wt-linux-amd64.tar.gz"
      sha256 "9d052d235779c9d7a177bb5f781b8f49d9190532d3c8b3ad76688c17eeb5fec0"
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
    assert_match "git-wt version 0.8.1", shell_output("#{bin}/git-wt --version")
    assert_match "worktree", shell_output("#{bin}/git-wt --help")
  end
end
