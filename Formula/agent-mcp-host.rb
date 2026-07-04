class AgentMcpHost < Formula
  desc "One-origin MCP host for the agent-* CLI family"
  homepage "https://github.com/shhac/agent-mcp-host"
  version "0.4.1"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-mcp-host/releases/download/v0.4.1/agent-mcp-host-darwin-arm64.tar.gz"
      sha256 "75ee92d16067c35cc6533d0bb98d8d49a2fc8dbb2ed2b12988096a87b3ec023c"
    end
    on_intel do
      url "https://github.com/shhac/agent-mcp-host/releases/download/v0.4.1/agent-mcp-host-darwin-amd64.tar.gz"
      sha256 "54fac9df35329a988218437aa090746fcc0fac7b9e458bdf6f00e5b077b5d6d0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-mcp-host/releases/download/v0.4.1/agent-mcp-host-linux-arm64.tar.gz"
      sha256 "9d31d26686d90c68319c22119d8733545a9c950cc50f0001206473260de304d9"
    end
    on_intel do
      url "https://github.com/shhac/agent-mcp-host/releases/download/v0.4.1/agent-mcp-host-linux-amd64.tar.gz"
      sha256 "5345291d88d7277b21287ca6e2300cd7a9cb8d14c65a82f5c89251fdd5cb7686"
    end
  end

  def install
    bin.install "agent-mcp-host"
    # Installs shell completions via `agent-mcp-host completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-mcp-host", "completion")
  end

  test do
    assert_match "0.4.1", shell_output("#{bin}/agent-mcp-host --version")
    assert_match "MCP host", shell_output("#{bin}/agent-mcp-host --help")
    assert_match "#compdef agent-mcp-host", shell_output("#{bin}/agent-mcp-host completion zsh")
  end
end
