class AgentMcpHost < Formula
  desc "One-origin MCP host for the agent-* CLI family"
  homepage "https://github.com/shhac/agent-mcp-host"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-mcp-host/releases/download/v0.1.0/agent-mcp-host-darwin-arm64.tar.gz"
      sha256 "0667bfeb6913faf0f864cab98e3da1336acf71aa9cf21d46bfca0640371f011a"
    end
    on_intel do
      url "https://github.com/shhac/agent-mcp-host/releases/download/v0.1.0/agent-mcp-host-darwin-amd64.tar.gz"
      sha256 "01ed0283d15ec864f307bc67d42fae799d76e30d7ca4a1916451a612d5d956ca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-mcp-host/releases/download/v0.1.0/agent-mcp-host-linux-arm64.tar.gz"
      sha256 "380b3b6cf3ede25c82c5cd55609cc10f1285ca5be757d07b49fd8105f8d5d968"
    end
    on_intel do
      url "https://github.com/shhac/agent-mcp-host/releases/download/v0.1.0/agent-mcp-host-linux-amd64.tar.gz"
      sha256 "bd488e1b22108a74b9594dac5be7ada41c067a709367c83c30d7c9e6116134b6"
    end
  end

  def install
    bin.install "agent-mcp-host"
    # Installs shell completions via `agent-mcp-host completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-mcp-host", "completion")
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/agent-mcp-host --version")
    assert_match "MCP host", shell_output("#{bin}/agent-mcp-host --help")
    assert_match "#compdef agent-mcp-host", shell_output("#{bin}/agent-mcp-host completion zsh")
  end
end
