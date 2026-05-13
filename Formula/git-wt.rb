class GitWt < Formula
  desc "Fast CLI for managing git worktrees with enhanced features"
  homepage "https://github.com/shhac/git-wt"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-wt/releases/download/v0.9.0/git-wt-darwin-arm64.tar.gz"
      sha256 "1114c1cfe5f907bd387d124942ee37d6c92e454de423df9c76ec7e3f02bba465"
    end
    on_intel do
      url "https://github.com/shhac/git-wt/releases/download/v0.9.0/git-wt-darwin-amd64.tar.gz"
      sha256 "77df015e3499df6d34fc490e34f6e7f3a683ce7a863c7592d0154d9124af3063"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-wt/releases/download/v0.9.0/git-wt-linux-arm64.tar.gz"
      sha256 "fd9f9817132ba04f7ccd994bc8862a37738ee4a4ef0c846d56863b120bd08dbd"
    end
    on_intel do
      url "https://github.com/shhac/git-wt/releases/download/v0.9.0/git-wt-linux-amd64.tar.gz"
      sha256 "c81a5d688e3eae684dded44814ec7271fa891f98a7524736a54523d7bf5a534c"
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
    assert_match "git-wt version 0.9.0", shell_output("#{bin}/git-wt --version")
    assert_match "worktree", shell_output("#{bin}/git-wt --help")
  end
end
