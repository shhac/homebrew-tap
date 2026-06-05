class GitHunk < Formula
  desc "Non-interactive CLI for staging git diff hunks by content hash"
  homepage "https://github.com/shhac/git-hunk"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.14.2/git-hunk-aarch64-macos.tar.gz"
      sha256 "53122b9e5f1e27207deeec6168b6c9f5cd76e728bb871526dd37431d78450eea"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.14.2/git-hunk-x86_64-macos.tar.gz"
      sha256 "8d009f9c03126e27a8af843cccf12ff44e442ca83fc928ee0130ce693b2b6cef"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.14.2/git-hunk-aarch64-linux.tar.gz"
      sha256 "2a91a733806926edd01677f73caf33c295da137265c1b9d4f8008fe42a24ea89"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.14.2/git-hunk-x86_64-linux.tar.gz"
      sha256 "bf93824ac781bec9cafcd52f6d4c3902602154ed66c8c4db1ceda827ac2d970e"
    end
  end

  def install
    bin.install "git-hunk"
    man1.install "git-hunk.1" if File.exist? "git-hunk.1"
  end

  test do
    assert_match "git-hunk 0.14.2", shell_output("#{bin}/git-hunk --version")
  end
end
