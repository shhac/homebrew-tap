class AgentMcpHost < Formula
  desc "One-origin MCP host for the agent-* CLI family"
  homepage "https://github.com/shhac/agent-mcp-host"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-mcp-host/releases/download/v0.2.0/agent-mcp-host-darwin-arm64.tar.gz"
      sha256 "fffdf03c000825fc0ba5516dffc0a3b37a857ab3e2797cd1fc006ecb0af9f8ab"
    end
    on_intel do
      url "https://github.com/shhac/agent-mcp-host/releases/download/v0.2.0/agent-mcp-host-darwin-amd64.tar.gz"
      sha256 "53b197e239a39696442529d895d6de5a5a3716632aa325a63a7db795e0baf8db"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-mcp-host/releases/download/v0.2.0/agent-mcp-host-linux-arm64.tar.gz"
      sha256 "1289da96c1fcb5455e87ed3b181452b249a2a01f9f8a14909731fc2121e0c336"
    end
    on_intel do
      url "https://github.com/shhac/agent-mcp-host/releases/download/v0.2.0/agent-mcp-host-linux-amd64.tar.gz"
      sha256 "f9cdef33cbcddf5dc25140d1ce9ed8382901d8d27ae2f7ca74cce0d5288a40b4"
    end
  end

  def install
    bin.install "agent-mcp-host"
    # Installs shell completions via `agent-mcp-host completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-mcp-host", "completion")
  end

  test do
    assert_match "0.2.0", shell_output("#{bin}/agent-mcp-host --version")
    assert_match "MCP host", shell_output("#{bin}/agent-mcp-host --help")
    assert_match "#compdef agent-mcp-host", shell_output("#{bin}/agent-mcp-host completion zsh")
  end
end
