class AgentMcpHost < Formula
  desc "One-origin MCP host for the agent-* CLI family"
  homepage "https://github.com/shhac/agent-mcp-host"
  version "0.6.2"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-mcp-host/releases/download/v0.6.2/agent-mcp-host-darwin-arm64.tar.gz"
      sha256 "65f72ab9cc431eeb58d61901b26047d0f406363087d488dbe411fc74606ef745"
    end
    on_intel do
      url "https://github.com/shhac/agent-mcp-host/releases/download/v0.6.2/agent-mcp-host-darwin-amd64.tar.gz"
      sha256 "0d4439fd379593e2fb3d600885d52acc2f7966711b2d5ae2cb8b7d4b1b6f14ea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-mcp-host/releases/download/v0.6.2/agent-mcp-host-linux-arm64.tar.gz"
      sha256 "eb7a931826d0957bb85f4bcc5e69959d0fc264fc92707ec3b1c46a43fdbef574"
    end
    on_intel do
      url "https://github.com/shhac/agent-mcp-host/releases/download/v0.6.2/agent-mcp-host-linux-amd64.tar.gz"
      sha256 "fde7af5933db9c8dd58337eb02eb0697a2bbb68f9fbdb5f39555ac79ef364829"
    end
  end

  def install
    bin.install "agent-mcp-host"
    # Installs shell completions via `agent-mcp-host completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-mcp-host", "completion")
  end

  test do
    assert_match "0.6.2", shell_output("#{bin}/agent-mcp-host --version")
    assert_match "MCP host", shell_output("#{bin}/agent-mcp-host --help")
    assert_match "#compdef agent-mcp-host", shell_output("#{bin}/agent-mcp-host completion zsh")
  end
end
