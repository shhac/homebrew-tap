class GitHunk < Formula
  desc "Non-interactive CLI for staging git diff hunks by content hash"
  homepage "https://github.com/shhac/git-hunk"
  version "0.10.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.10.2/git-hunk-aarch64-macos.tar.gz"
      sha256 "cc440bce3ef41f237151d344d852a8ffa6be3084eae89ed257abc77a2d2eedc5"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.10.2/git-hunk-x86_64-macos.tar.gz"
      sha256 "a2aa64dff104fadab4bd8f33e2bab9a60d55e5509134f8c51bb910b07a9cf81d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.10.2/git-hunk-aarch64-linux.tar.gz"
      sha256 "b73d6649fae94a42e739d28ef09cfa6ad8f89e54a01bf5baf1dff62369da9e3d"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.10.2/git-hunk-x86_64-linux.tar.gz"
      sha256 "518c6b37d3c2a0b216a4aaa01391684688b9d311e0b672bba585c936a5bc51e2"
    end
  end

  def install
    bin.install "git-hunk"
    man1.install "git-hunk.1" if File.exist? "git-hunk.1"
  end

  test do
    assert_match "git-hunk 0.10.2", shell_output("#{bin}/git-hunk --version")
  end
end
