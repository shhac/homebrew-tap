class AgentMcpHost < Formula
  desc "One-origin MCP host for the agent-* CLI family"
  homepage "https://github.com/shhac/agent-mcp-host"
  version "0.6.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-mcp-host/releases/download/v0.6.0/agent-mcp-host-darwin-arm64.tar.gz"
      sha256 "f0a3259dd793f1b75d93a7b9a10793ac24b550fd616c3523965672fb01f83ba4"
    end
    on_intel do
      url "https://github.com/shhac/agent-mcp-host/releases/download/v0.6.0/agent-mcp-host-darwin-amd64.tar.gz"
      sha256 "746c60f7be427a30d854b1df6e060ea68ffb1ffa993ac601883b1d7dc2add665"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-mcp-host/releases/download/v0.6.0/agent-mcp-host-linux-arm64.tar.gz"
      sha256 "c9b48dfbdf7dcf192c8ec4407ed2244f14c988b7c76c345e0b083b7685793471"
    end
    on_intel do
      url "https://github.com/shhac/agent-mcp-host/releases/download/v0.6.0/agent-mcp-host-linux-amd64.tar.gz"
      sha256 "55d69a1c4bbcb7b3b1ca7a32e932a6588d5f122edc53a58dcee82e57dc3f3458"
    end
  end

  def install
    bin.install "agent-mcp-host"
    # Installs shell completions via `agent-mcp-host completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-mcp-host", "completion")
  end

  test do
    assert_match "0.6.0", shell_output("#{bin}/agent-mcp-host --version")
    assert_match "MCP host", shell_output("#{bin}/agent-mcp-host --help")
    assert_match "#compdef agent-mcp-host", shell_output("#{bin}/agent-mcp-host completion zsh")
  end
end
