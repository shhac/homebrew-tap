class GitHunk < Formula
  desc "Non-interactive CLI for staging git diff hunks by content hash"
  homepage "https://github.com/shhac/git-hunk"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.14.3/git-hunk-aarch64-macos.tar.gz"
      sha256 "6811d90734d5e692103351cb817998948a104634c5aafcc091bb305e5fac5034"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.14.3/git-hunk-x86_64-macos.tar.gz"
      sha256 "49510247539a1439ffdb6263318b789b76e58cd6b7ea05354092616c3c4ab07e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.14.3/git-hunk-aarch64-linux.tar.gz"
      sha256 "958ffe248ca611985889093ae5e3d3ccbfedf93a1d94352700b5f9b61442152a"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.14.3/git-hunk-x86_64-linux.tar.gz"
      sha256 "eac4d0bd65949f3024cb8f26e6549db5e96cc9b383ddbbd01e64dca5d70f1fa9"
    end
  end

  def install
    bin.install "git-hunk"
    man1.install "git-hunk.1" if File.exist? "git-hunk.1"
  end

  test do
    assert_match "git-hunk 0.14.3", shell_output("#{bin}/git-hunk --version")
  end
end
