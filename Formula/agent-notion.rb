class AgentNotion < Formula
  desc "Notion CLI for humans and LLMs"
  homepage "https://github.com/shhac/agent-notion"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-notion/releases/download/v0.3.1/agent-notion-darwin-arm64.tar.gz"
      sha256 "cc038daebb2bc5c087ebdd26f4a15820139722a6d280f4b684ec22d663dea674"
    end
    on_intel do
      url "https://github.com/shhac/agent-notion/releases/download/v0.3.1/agent-notion-darwin-x64.tar.gz"
      sha256 "1f860e1e6b5773a885d318473848b19a33eae584114fd42cd3c2d129a6a015de"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-notion/releases/download/v0.3.1/agent-notion-linux-arm64.tar.gz"
      sha256 "4d4993530f614451d91d4417d4cd68159b3c329bf1bd97277493821cf46da829"
    end
    on_intel do
      url "https://github.com/shhac/agent-notion/releases/download/v0.3.1/agent-notion-linux-x64.tar.gz"
      sha256 "1b9f063c74a2ee02aaa3dce67d96497a72308a4898491602b98f27f70642901d"
    end
  end

  def install
    bin.install Dir["agent-notion-*"].first => "agent-notion"
  end

  test do
    assert_match "0.3.1", shell_output("#{bin}/agent-notion --version")
    assert_match "Notion CLI", shell_output("#{bin}/agent-notion --help")
  end
end
