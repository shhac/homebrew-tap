class GitHunk < Formula
  desc "Non-interactive CLI for staging git diff hunks by content hash"
  homepage "https://github.com/shhac/git-hunk"
  version "0.14.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.14.0/git-hunk-aarch64-macos.tar.gz"
      sha256 "134fd66ca37e900b0abb9492cf026ec2bd6402daf10285e07dcae8625c85d24a"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.14.0/git-hunk-x86_64-macos.tar.gz"
      sha256 "e220d5c028a77536896000404b0ef2acc80512878fbb3a89253ce15b7ec01e53"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.14.0/git-hunk-aarch64-linux.tar.gz"
      sha256 "a45a643c12282871953bcc6da523d5b64d7f5e7ea0eea91d16a4241ad8be8917"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.14.0/git-hunk-x86_64-linux.tar.gz"
      sha256 "9c68d64f3f8a440c3d4844037d1809862fb5c6c2497f37c242f8d2fdcc9a93e7"
    end
  end

  def install
    bin.install "git-hunk"
    man1.install "git-hunk.1" if File.exist? "git-hunk.1"
  end

  test do
    assert_match "git-hunk 0.14.0", shell_output("#{bin}/git-hunk --version")
  end
end
