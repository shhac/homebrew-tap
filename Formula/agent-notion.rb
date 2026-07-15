class AgentNotion < Formula
  desc "Notion CLI for humans and LLMs"
  homepage "https://github.com/shhac/agent-notion"
  version "0.8.1"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-notion/releases/download/v0.8.1/agent-notion-darwin-arm64.tar.gz"
      sha256 "15f85b23f17c9ac3efc4e4bdd2fc953e465175189b63ee2bbd43cc25a3c331b4"
    end
    on_intel do
      url "https://github.com/shhac/agent-notion/releases/download/v0.8.1/agent-notion-darwin-amd64.tar.gz"
      sha256 "516ef34fd970c894d60d1dfa2b565ed9bfe4bf87872dd770fd88f5abc776d717"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-notion/releases/download/v0.8.1/agent-notion-linux-arm64.tar.gz"
      sha256 "73fe9e98d6347f35e86580c0bf2a07e85a749ddc4f950a67e08e7051eaede179"
    end
    on_intel do
      url "https://github.com/shhac/agent-notion/releases/download/v0.8.1/agent-notion-linux-amd64.tar.gz"
      sha256 "f6f683971ea069a1ec9028e65d4535a6ff3c9e41cd4c0785fe52c02da47d7f19"
    end
  end

  def install
    bin.install "agent-notion"
    # Installs shell completions via `agent-notion completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-notion", "completion")
  end

  test do
    assert_match "0.8.1", shell_output("#{bin}/agent-notion --version")
    assert_match "Notion CLI for humans and LLMs", shell_output("#{bin}/agent-notion --help")
    assert_match "#compdef agent-notion", shell_output("#{bin}/agent-notion completion zsh")
  end
end
