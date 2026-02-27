class GitHunk < Formula
  desc "Non-interactive CLI for staging git diff hunks by content hash"
  homepage "https://github.com/shhac/git-hunk"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.4.0/git-hunk-aarch64-macos.tar.gz"
      sha256 "07c2bdf3618abe1a2d498e91a086522cd2c81b50ee7deb727502387d40630137"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.4.0/git-hunk-x86_64-macos.tar.gz"
      sha256 "c3d43973784ff8dfa59eea37fbaf7603e03c56d77d7115ac2b5506dcff183c3b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.4.0/git-hunk-aarch64-linux.tar.gz"
      sha256 "0c602727ea5920e099125e057de5b09d4e88c3e16017fae16e00ca38d124c293"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.4.0/git-hunk-x86_64-linux.tar.gz"
      sha256 "edd3f6b396a6d4709c79d213fc9e89e62ec29ebdd71a98ae956892cbe495e78f"
    end
  end

  def install
    bin.install "git-hunk"
  end

  test do
    assert_match "git-hunk 0.4.0", shell_output("#{bin}/git-hunk --version")
  end
end
