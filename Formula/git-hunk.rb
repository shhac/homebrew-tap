class GitHunk < Formula
  desc "Non-interactive CLI for staging git diff hunks by content hash"
  homepage "https://github.com/shhac/git-hunk"
  version "0.7.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.7.1/git-hunk-aarch64-macos.tar.gz"
      sha256 "06e6eb68d93d6cbf83cad1e2d192fff486d7471c34279a42260edc94328fa330"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.7.1/git-hunk-x86_64-macos.tar.gz"
      sha256 "069e591692d4ca12693583ee34a6186c9e73315d1b79a2814e798b51fae691d7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.7.1/git-hunk-aarch64-linux.tar.gz"
      sha256 "7da6b27c346b49b3aeb623aa2eff45fbbfbe6ce659c538b355610bd5e6406691"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.7.1/git-hunk-x86_64-linux.tar.gz"
      sha256 "4f7219f3eee1926e6058073d103ee56abb696f43ec7b1cca8050284981d5bac5"
    end
  end

  def install
    bin.install "git-hunk"
    man1.install "git-hunk.1" if File.exist? "git-hunk.1"
  end

  test do
    assert_match "git-hunk 0.7.1", shell_output("#{bin}/git-hunk --version")
  end
end
