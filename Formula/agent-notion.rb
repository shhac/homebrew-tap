class AgentNotion < Formula
  desc "Notion CLI for humans and LLMs"
  homepage "https://github.com/shhac/agent-notion"
  version "0.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-notion/releases/download/v0.2.2/agent-notion-darwin-arm64.tar.gz"
      sha256 "05305dd393e99bb29e831e7144b1329b1f860180889478213906439d1484622a"
    end
    on_intel do
      url "https://github.com/shhac/agent-notion/releases/download/v0.2.2/agent-notion-darwin-x64.tar.gz"
      sha256 "0535543c52cb3dc26774e172bb614dd03562d0a8002b5aa0c56baf5ec5223169"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-notion/releases/download/v0.2.2/agent-notion-linux-arm64.tar.gz"
      sha256 "13b8f896039301f136a702a317e5e0132b9985516f8e989b2b9d1fafcb2f025b"
    end
    on_intel do
      url "https://github.com/shhac/agent-notion/releases/download/v0.2.2/agent-notion-linux-x64.tar.gz"
      sha256 "43cda1958ea91c215b7b72fd02f5a1b1c1f34518883bf23590afad362bd2d751"
    end
  end

  def install
    bin.install Dir["agent-notion-*"].first => "agent-notion"
  end

  test do
    assert_match "0.2.2", shell_output("#{bin}/agent-notion --version")
    assert_match "Notion CLI", shell_output("#{bin}/agent-notion --help")
  end
end
