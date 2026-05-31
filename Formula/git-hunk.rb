class GitHunk < Formula
  desc "Non-interactive CLI for staging git diff hunks by content hash"
  homepage "https://github.com/shhac/git-hunk"
  version "0.14.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.14.1/git-hunk-aarch64-macos.tar.gz"
      sha256 "44d75b4f4cc75f8438f3f31e24b254bb2fed05e8a550ae50f57c7d7de17dc837"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.14.1/git-hunk-x86_64-macos.tar.gz"
      sha256 "f11ceb4b92ee353ee1989c314a7c547ff5b944e70a6b82537c31c57c3728aabe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.14.1/git-hunk-aarch64-linux.tar.gz"
      sha256 "09435013a2e15607801618e4950d37c0e482aea439793fc15f68c86ee542d3ed"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.14.1/git-hunk-x86_64-linux.tar.gz"
      sha256 "ac9b6e8521b6aeae83556496d45b61a0a9130ca027b6a7c4801ce5be6f4bf6b7"
    end
  end

  def install
    bin.install "git-hunk"
    man1.install "git-hunk.1" if File.exist? "git-hunk.1"
  end

  test do
    assert_match "git-hunk 0.14.1", shell_output("#{bin}/git-hunk --version")
  end
end
