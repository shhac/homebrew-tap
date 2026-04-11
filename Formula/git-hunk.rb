class GitHunk < Formula
  desc "Non-interactive CLI for staging git diff hunks by content hash"
  homepage "https://github.com/shhac/git-hunk"
  version "0.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.12.0/git-hunk-aarch64-macos.tar.gz"
      sha256 "de10469e97fbb1349c8ea70a37e27906aecaceb132c21a0979bc86a99e65b610"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.12.0/git-hunk-x86_64-macos.tar.gz"
      sha256 "ef9da15342f1a3bad95d374d007379cbd7c8350ff839148e3984f7d0357c3480"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.12.0/git-hunk-aarch64-linux.tar.gz"
      sha256 "93fa54d609015325a9857ebca29ed1f31e55da6b320eb7d119c15bf9d42c5ad6"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.12.0/git-hunk-x86_64-linux.tar.gz"
      sha256 "12ec4dd99c51390293d928fcc4685176d9cbdcc489286a8cedf32e425391c74a"
    end
  end

  def install
    bin.install "git-hunk"
    man1.install "git-hunk.1" if File.exist? "git-hunk.1"
  end

  test do
    assert_match "git-hunk 0.12.0", shell_output("#{bin}/git-hunk --version")
  end
end
