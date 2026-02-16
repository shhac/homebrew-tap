class AgentNotion < Formula
  desc "Notion CLI for humans and LLMs"
  homepage "https://github.com/shhac/agent-notion"
  version "0.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-notion/releases/download/v0.0.1/agent-notion-darwin-arm64.tar.gz"
      sha256 "40628cc6a8db86b3ce86c4d0c214f64c5f1ec389265b9bcd81810d65b7a62da1"
    end
    on_intel do
      url "https://github.com/shhac/agent-notion/releases/download/v0.0.1/agent-notion-darwin-x64.tar.gz"
      sha256 "5a0ea4e28b5d111c2d86f2d437a470df907ad83109530cebd45bdc8a3d02dedf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-notion/releases/download/v0.0.1/agent-notion-linux-arm64.tar.gz"
      sha256 "2ef7934c11e8c9f9105fe05c30c10c6fb8d038e449275d10d4a2108eb46f2e45"
    end
    on_intel do
      url "https://github.com/shhac/agent-notion/releases/download/v0.0.1/agent-notion-linux-x64.tar.gz"
      sha256 "ba28c9f7b961bc4155cb3b770571955dff674665b4d07904e3e181ed594c7967"
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
