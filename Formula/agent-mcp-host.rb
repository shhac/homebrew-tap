class AgentMcpHost < Formula
  desc "One-origin MCP host for the agent-* CLI family"
  homepage "https://github.com/shhac/agent-mcp-host"
  version "0.4.0"
  license "PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-mcp-host/releases/download/v0.4.0/agent-mcp-host-darwin-arm64.tar.gz"
      sha256 "665a77716f37e4180a94aff2f8e303ddf23066be7b963a25e1fcd98af7bb873a"
    end
    on_intel do
      url "https://github.com/shhac/agent-mcp-host/releases/download/v0.4.0/agent-mcp-host-darwin-amd64.tar.gz"
      sha256 "fa0177b4184881ad0e9a2af8ac4b9de96c76bd6d6909c6e13245cb992d830dbf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-mcp-host/releases/download/v0.4.0/agent-mcp-host-linux-arm64.tar.gz"
      sha256 "9a370363408e97953c00e18d548273f3322e9b06b1ff04da89300e86e4d492af"
    end
    on_intel do
      url "https://github.com/shhac/agent-mcp-host/releases/download/v0.4.0/agent-mcp-host-linux-amd64.tar.gz"
      sha256 "5f67045731bb99d580f05bb52a1e5856cce1ea47b4bcb8ac0ae8be530cb9a902"
    end
  end

  def install
    bin.install "agent-mcp-host"
    # Installs shell completions via `agent-mcp-host completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-mcp-host", "completion")
  end

  test do
    assert_match "0.4.0", shell_output("#{bin}/agent-mcp-host --version")
    assert_match "MCP host", shell_output("#{bin}/agent-mcp-host --help")
    assert_match "#compdef agent-mcp-host", shell_output("#{bin}/agent-mcp-host completion zsh")
  end
end
