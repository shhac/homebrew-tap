class GitHunk < Formula
  desc "Non-interactive CLI for staging git diff hunks by content hash"
  homepage "https://github.com/shhac/git-hunk"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.2.0/git-hunk-aarch64-macos.tar.gz"
      sha256 "6a35ab79227d235d6f7332dc2f1c0d30ad03c7cd4c88cd55e7ec819d56464b60"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.2.0/git-hunk-x86_64-macos.tar.gz"
      sha256 "862df05bbd80e0ca93a35b8231eff74be96ce36b7323ff037da3cd7d074e969a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.2.0/git-hunk-aarch64-linux.tar.gz"
      sha256 "1a4828bdb3810990b4a309d3bbf67ddd942a654ba9b96cea1bde32898491c25a"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.2.0/git-hunk-x86_64-linux.tar.gz"
      sha256 "273565eb88d66f3c9112a37fe560bc3bc4dbe30631aeae7fceb47ba343c49e21"
    end
  end

  def install
    bin.install "git-hunk"
  end

  test do
    assert_match "git-hunk 0.2.0", shell_output("#{bin}/git-hunk --version")
  end
end
