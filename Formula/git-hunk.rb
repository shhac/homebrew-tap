class GitHunk < Formula
  desc "Non-interactive CLI for staging git diff hunks by content hash"
  homepage "https://github.com/shhac/git-hunk"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.1.0/git-hunk-aarch64-macos.tar.gz"
      sha256 "631f1b5bc37e42ee14b0e37ca6a5d24a52d46b1e7a9e763d045a8b44e9949598"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.1.0/git-hunk-x86_64-macos.tar.gz"
      sha256 "501d990ca037b201270cb7e4adea5252e468080526b0d7ed85dfaff186b26034"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.1.0/git-hunk-aarch64-linux.tar.gz"
      sha256 "b1d18eb76892cf87c91d943ba4f3566e91ed02b6219ea0af5c574c749ca09b05"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.1.0/git-hunk-x86_64-linux.tar.gz"
      sha256 "8773cb1a954771a5b729ca82b90c8a863ade9231abede6a2e1d4f59857fa3337"
    end
  end

  def install
    bin.install "git-hunk"
  end

  test do
    assert_match "git-hunk 0.1.0", shell_output("#{bin}/git-hunk --version")
  end
end
