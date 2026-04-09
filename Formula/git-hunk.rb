class GitHunk < Formula
  desc "Non-interactive CLI for staging git diff hunks by content hash"
  homepage "https://github.com/shhac/git-hunk"
  version "0.11.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.11.1/git-hunk-aarch64-macos.tar.gz"
      sha256 "634b12028006be5eb3d8be9db6eac711d771a8ee0ad11ae7454dbcfb29a3610f"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.11.1/git-hunk-x86_64-macos.tar.gz"
      sha256 "923a1132100b354409a371ad7e45715d8d9f8e4386282fda8fc54c359e866686"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.11.1/git-hunk-aarch64-linux.tar.gz"
      sha256 "9f0d1d0eea3063b277a0ba23d26f5d8fd48fde9e815ea3f8a8157a9ace5204b3"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.11.1/git-hunk-x86_64-linux.tar.gz"
      sha256 "297e13e434f9e3ad151f135d3f9c3b10ebc10bdbd1f07d82bca4bfaa37c6f290"
    end
  end

  def install
    bin.install "git-hunk"
    man1.install "git-hunk.1" if File.exist? "git-hunk.1"
  end

  test do
    assert_match "git-hunk 0.11.1", shell_output("#{bin}/git-hunk --version")
  end
end
