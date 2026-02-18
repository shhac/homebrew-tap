class AgentNotion < Formula
  desc "Notion CLI for humans and LLMs"
  homepage "https://github.com/shhac/agent-notion"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-notion/releases/download/v0.2.0/agent-notion-darwin-arm64.tar.gz"
      sha256 "272aa6f3ae9a426474753784a28e5a9abaea7e506adbee448f350babddece21d"
    end
    on_intel do
      url "https://github.com/shhac/agent-notion/releases/download/v0.2.0/agent-notion-darwin-x64.tar.gz"
      sha256 "86b1ea539cf4fcccdcb32ab7f0eac4b3b9e758bff991218ef2b23fb46d8828d9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-notion/releases/download/v0.2.0/agent-notion-linux-arm64.tar.gz"
      sha256 "3f9b0aae097c4faf6c01605d7f209801938674cfaf27ffe2255df159b87795ca"
    end
    on_intel do
      url "https://github.com/shhac/agent-notion/releases/download/v0.2.0/agent-notion-linux-x64.tar.gz"
      sha256 "4f68d30a66e0be9411f20d65cfb73dfcc9083954f36dbdd41c82212aa72e90c4"
    end
  end

  def install
    bin.install Dir["agent-notion-*"].first => "agent-notion"
  end

  test do
    assert_match "0.2.0", shell_output("#{bin}/agent-notion --version")
    assert_match "Notion CLI", shell_output("#{bin}/agent-notion --help")
  end
end
