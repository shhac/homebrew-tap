class AgentNotion < Formula
  desc "Notion CLI for humans and LLMs"
  homepage "https://github.com/shhac/agent-notion"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-notion/releases/download/v0.6.0/agent-notion-darwin-arm64.tar.gz"
      sha256 "f11f288af8639f8b589dbb09c45669d19227ac7b1aa5cb529223e1d802be80ef"
    end
    on_intel do
      url "https://github.com/shhac/agent-notion/releases/download/v0.6.0/agent-notion-darwin-x64.tar.gz"
      sha256 "6b063899c4651e720975697ae06e41a1246bbd8101c0955c5bb5bebc43164497"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-notion/releases/download/v0.6.0/agent-notion-linux-arm64.tar.gz"
      sha256 "d7ab653b5f4539290a33e4d51f070cf248fb88b0f8c241bf64f01252753a6f72"
    end
    on_intel do
      url "https://github.com/shhac/agent-notion/releases/download/v0.6.0/agent-notion-linux-x64.tar.gz"
      sha256 "3df0345c460716e0b281c018a61c5b508218258ce7fc6c154654b8733b2577f4"
    end
  end

  def install
    bin.install Dir["agent-notion-*"].first => "agent-notion"
  end

  test do
    assert_match "0.6.0", shell_output("#{bin}/agent-notion --version")
    assert_match "Notion CLI", shell_output("#{bin}/agent-notion --help")
  end
end
