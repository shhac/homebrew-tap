class AgentNotion < Formula
  desc "Notion CLI for humans and LLMs"
  homepage "https://github.com/shhac/agent-notion"
  version "0.0.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-notion/releases/download/v0.0.2/agent-notion-darwin-arm64.tar.gz"
      sha256 "76e2412b5201099e3ac6897725745b5e192290fd699cf9feb6051b62f167b3d4"
    end
    on_intel do
      url "https://github.com/shhac/agent-notion/releases/download/v0.0.2/agent-notion-darwin-x64.tar.gz"
      sha256 "9e542eb18a467079cc22c2686a7da8865abad47251b78d8ceb05a47b3abd23aa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-notion/releases/download/v0.0.2/agent-notion-linux-arm64.tar.gz"
      sha256 "06654987e99f6b1b8278b269150a96b0d030b51849f8640782ed9c027b11ee4f"
    end
    on_intel do
      url "https://github.com/shhac/agent-notion/releases/download/v0.0.2/agent-notion-linux-x64.tar.gz"
      sha256 "929e71811cef390cc86ea04828c1098f424c45d74b6f7a720e663bb64279f677"
    end
  end

  def install
    bin.install Dir["agent-notion-*"].first => "agent-notion"
  end

  test do
    assert_match "0.0.2", shell_output("#{bin}/agent-notion --version")
    assert_match "Notion CLI", shell_output("#{bin}/agent-notion --help")
  end
end
