class AgentNotion < Formula
  desc "Notion CLI for humans and LLMs"
  homepage "https://github.com/shhac/agent-notion"
  version "0.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-notion/releases/download/v0.0.1/agent-notion-darwin-arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
    on_intel do
      url "https://github.com/shhac/agent-notion/releases/download/v0.0.1/agent-notion-darwin-x64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-notion/releases/download/v0.0.1/agent-notion-linux-arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
    on_intel do
      url "https://github.com/shhac/agent-notion/releases/download/v0.0.1/agent-notion-linux-x64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  def install
    bin.install Dir["agent-notion-*"].first => "agent-notion"
  end

  test do
    assert_match "0.0.1", shell_output("#{bin}/agent-notion --version")
    assert_match "Notion CLI", shell_output("#{bin}/agent-notion --help")
  end
end
