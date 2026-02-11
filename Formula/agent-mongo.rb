class AgentMongo < Formula
  desc "Read-only MongoDB CLI for AI agents"
  homepage "https://github.com/shhac/agent-mongo"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.1.0/agent-mongo-darwin-arm64.tar.gz"
      sha256 "f812093c6ff0788bdfc05eb8d3375b05babb8bb52e3d597c97ebe191ec087fe9"
    end
    on_intel do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.1.0/agent-mongo-darwin-x64.tar.gz"
      sha256 "cb45e460e0226de4c57d776d6ab7cdf9a804ef73e57455cd3b6a52018ba67a86"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.1.0/agent-mongo-linux-arm64.tar.gz"
      sha256 "5d9d6001264d6f91780d20107dcf8ced42d097bc75d5424430e86acd6552b207"
    end
    on_intel do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.1.0/agent-mongo-linux-x64.tar.gz"
      sha256 "f06e4b64746e70c56b1ccb94e53e0ed7ea180cb431a17bf3c4bdc7b04b38e6cc"
    end
  end

  def install
    bin.install Dir["agent-mongo-*"].first => "agent-mongo"
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/agent-mongo --version")
    assert_match "MongoDB CLI", shell_output("#{bin}/agent-mongo --help")
  end
end
