class GitHunk < Formula
  desc "Non-interactive CLI for staging git diff hunks by content hash"
  homepage "https://github.com/shhac/git-hunk"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.3.1/git-hunk-aarch64-macos.tar.gz"
      sha256 "867926a3fdd4b4c464376e715ebfb92ae371a74ee808c6e4179058c4ba15ba8b"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.3.1/git-hunk-x86_64-macos.tar.gz"
      sha256 "8e77172f8018909983655567986ebecccd0ee6acabacaafcf674c17ed2d158d0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.3.1/git-hunk-aarch64-linux.tar.gz"
      sha256 "de337504d72788491c09f282a107df3fa1bc75f4593deb2a28f1ac390e953636"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.3.1/git-hunk-x86_64-linux.tar.gz"
      sha256 "dbd3a5cb0b84645ff44f1019f075f77d570af01b32b4ad9d96729677f9fceb9b"
    end
  end

  def install
    bin.install "git-hunk"
  end

  test do
    assert_match "git-hunk 0.3.1", shell_output("#{bin}/git-hunk --version")
  end
end
