class AgentNotion < Formula
  desc "Notion CLI for humans and LLMs"
  homepage "https://github.com/shhac/agent-notion"
  version "0.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-notion/releases/download/v0.4.1/agent-notion-darwin-arm64.tar.gz"
      sha256 "6af1d674c04b5cafd5c02efce87d321f060526806a8a1c7be1f890d01dbd431b"
    end
    on_intel do
      url "https://github.com/shhac/agent-notion/releases/download/v0.4.1/agent-notion-darwin-x64.tar.gz"
      sha256 "508edf3e3042acedb5910fd3cff6609da8e5e44a1372f8db10817a8ac410cf06"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-notion/releases/download/v0.4.1/agent-notion-linux-arm64.tar.gz"
      sha256 "323bb68713db5405233ed07f57b2f5e4b1958819e1d549cf202e15ce1c707107"
    end
    on_intel do
      url "https://github.com/shhac/agent-notion/releases/download/v0.4.1/agent-notion-linux-x64.tar.gz"
      sha256 "869d088a6c4b3b8247a4cf27de36882d9a31d5546247adc50e55bba6996f58c2"
    end
  end

  def install
    bin.install Dir["agent-notion-*"].first => "agent-notion"
  end

  test do
    assert_match "0.4.1", shell_output("#{bin}/agent-notion --version")
    assert_match "Notion CLI", shell_output("#{bin}/agent-notion --help")
  end
end
