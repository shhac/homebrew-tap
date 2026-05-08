class GitHunk < Formula
  desc "Non-interactive CLI for staging git diff hunks by content hash"
  homepage "https://github.com/shhac/git-hunk"
  version "0.13.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.13.0/git-hunk-aarch64-macos.tar.gz"
      sha256 "80825756a995b581b629f228da124d31ec49b5dedc3e7013fb55af3c096d0e16"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.13.0/git-hunk-x86_64-macos.tar.gz"
      sha256 "3aebd202a67ff001e3754cf4cf0c56b39bb4312b81183e1ef2f858bd4ae1258f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.13.0/git-hunk-aarch64-linux.tar.gz"
      sha256 "791c1066c008f993689ea80d1af55e251b2d6b2659627ac8f65a5f7c6e9f2ea7"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.13.0/git-hunk-x86_64-linux.tar.gz"
      sha256 "05a13d2cbd954fccdd875d5085efdb504365d218b5fc6329519a1e7b5d0f7472"
    end
  end

  def install
    bin.install "git-hunk"
    man1.install "git-hunk.1" if File.exist? "git-hunk.1"
  end

  test do
    assert_match "git-hunk 0.13.0", shell_output("#{bin}/git-hunk --version")
  end
end
