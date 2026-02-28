class GitHunk < Formula
  desc "Non-interactive CLI for staging git diff hunks by content hash"
  homepage "https://github.com/shhac/git-hunk"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.7.0/git-hunk-aarch64-macos.tar.gz"
      sha256 "ad0533b5b97258543ad24bf3c63abbb91567494950b9842fda265748527c3738"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.7.0/git-hunk-x86_64-macos.tar.gz"
      sha256 "e70f9bf79502dff581a8e0e43853af8d4faf39947d6ef98121489a90c344babf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.7.0/git-hunk-aarch64-linux.tar.gz"
      sha256 "d7b105ac8ac1299e8db3c540a72f778a45f9832a62126db58a07795b317e80e2"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.7.0/git-hunk-x86_64-linux.tar.gz"
      sha256 "a2b1636ac01f578a803838c71021f1a0cb0ed165fbca9be38c39217944f1fd7f"
    end
  end

  def install
    bin.install "git-hunk"
    man1.install "git-hunk.1" if File.exist? "git-hunk.1"
  end

  test do
    assert_match "git-hunk 0.7.0", shell_output("#{bin}/git-hunk --version")
  end
end
