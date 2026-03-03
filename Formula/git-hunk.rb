class GitHunk < Formula
  desc "Non-interactive CLI for staging git diff hunks by content hash"
  homepage "https://github.com/shhac/git-hunk"
  version "0.10.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.10.1/git-hunk-aarch64-macos.tar.gz"
      sha256 "8d7ac338370e766158d6240e337ecfd9ebbb0f4b2261beffc4cfa2ec421c4961"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.10.1/git-hunk-x86_64-macos.tar.gz"
      sha256 "76fd74799bc440910bf3adb5b6e25ab45c353ff4d953080e218b71c060435d7d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.10.1/git-hunk-aarch64-linux.tar.gz"
      sha256 "4f74aac1671f58add715766ddddccab245761a8f79b938116ae3abdb10177250"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.10.1/git-hunk-x86_64-linux.tar.gz"
      sha256 "28350e032afad1b323088662984dd997885b92c045cc1787f2f6e09d9d6c607b"
    end
  end

  def install
    bin.install "git-hunk"
    man1.install "git-hunk.1" if File.exist? "git-hunk.1"
  end

  test do
    assert_match "git-hunk 0.10.1", shell_output("#{bin}/git-hunk --version")
  end
end
