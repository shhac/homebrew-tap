class AgentMcpHost < Formula
  desc "One-origin MCP host for the agent-* CLI family"
  homepage "https://github.com/shhac/agent-mcp-host"
  version "0.6.1"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-mcp-host/releases/download/v0.6.1/agent-mcp-host-darwin-arm64.tar.gz"
      sha256 "c54c20e2e7a08c67d8e984c1e0e5e76e4d2ff2c413a79b8ff3f350dccfc583f0"
    end
    on_intel do
      url "https://github.com/shhac/agent-mcp-host/releases/download/v0.6.1/agent-mcp-host-darwin-amd64.tar.gz"
      sha256 "d2ee9b5c55dfd4666d4ae8ad23cb17b671b62d68b62aff02fb4407a3faf1192c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-mcp-host/releases/download/v0.6.1/agent-mcp-host-linux-arm64.tar.gz"
      sha256 "74755885ff47f3d28e383814395458f411b77b53b93a9e5af24883102ee777d5"
    end
    on_intel do
      url "https://github.com/shhac/agent-mcp-host/releases/download/v0.6.1/agent-mcp-host-linux-amd64.tar.gz"
      sha256 "030639daf72846b37d7049bacf2a8adb022df9f265b35a616c0fd254a46e303e"
    end
  end

  def install
    bin.install "agent-mcp-host"
    # Installs shell completions via `agent-mcp-host completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-mcp-host", "completion")
  end

  test do
    assert_match "0.6.1", shell_output("#{bin}/agent-mcp-host --version")
    assert_match "MCP host", shell_output("#{bin}/agent-mcp-host --help")
    assert_match "#compdef agent-mcp-host", shell_output("#{bin}/agent-mcp-host completion zsh")
  end
end
