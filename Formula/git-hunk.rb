class GitHunk < Formula
  desc "Non-interactive CLI for staging git diff hunks by content hash"
  homepage "https://github.com/shhac/git-hunk"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.6.0/git-hunk-aarch64-macos.tar.gz"
      sha256 "1d489bf19bf8a28312352dd3cd802f5e05aa13e22a50c523e9a3176b1569b91b"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.6.0/git-hunk-x86_64-macos.tar.gz"
      sha256 "4772c967f98884c1dc1530cd307d6cb2996e12e649b8488b53ad8b3ac5ead225"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.6.0/git-hunk-aarch64-linux.tar.gz"
      sha256 "54ffd6bd7de36b1bc8e92be06df5031aee8939ae73c21a026aff6e3e5b124e84"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.6.0/git-hunk-x86_64-linux.tar.gz"
      sha256 "468073709a1ec9611167a7d0a2e02fa5991792570b66a8013336121c7d961407"
    end
  end

  def install
    bin.install "git-hunk"
    man1.install "git-hunk.1" if File.exist? "git-hunk.1"
  end

  test do
    assert_match "git-hunk 0.6.0", shell_output("#{bin}/git-hunk --version")
  end
end
