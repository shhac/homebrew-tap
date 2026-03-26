class GitHunk < Formula
  desc "Non-interactive CLI for staging git diff hunks by content hash"
  homepage "https://github.com/shhac/git-hunk"
  version "0.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.11.0/git-hunk-aarch64-macos.tar.gz"
      sha256 "1d6842fe109ef88e771eac76afd3600ba5e19e150867f3f8ebce79674f518029"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.11.0/git-hunk-x86_64-macos.tar.gz"
      sha256 "958bc4c11776a0ed8c0f00a75e06d29bbece07d87dbb1fa8e738d89ab0d7c020"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.11.0/git-hunk-aarch64-linux.tar.gz"
      sha256 "5d02ece5543e582847fa4f2ea6ad18b4b063173b546dd82011a7a9ce39196790"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.11.0/git-hunk-x86_64-linux.tar.gz"
      sha256 "9b6ae1d14b26750ea2a1cea498eff68f8b1667aca7465115dda2470f8c6a6e44"
    end
  end

  def install
    bin.install "git-hunk"
    man1.install "git-hunk.1" if File.exist? "git-hunk.1"
  end

  test do
    assert_match "git-hunk 0.11.0", shell_output("#{bin}/git-hunk --version")
  end
end
