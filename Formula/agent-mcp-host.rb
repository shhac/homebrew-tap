class AgentMcpHost < Formula
  desc "One-origin MCP host for the agent-* CLI family"
  homepage "https://github.com/shhac/agent-mcp-host"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-mcp-host/releases/download/v0.3.0/agent-mcp-host-darwin-arm64.tar.gz"
      sha256 "89d2aa6c374733db41358544df931f6fa310abdd570652f760d84644ca11b1c6"
    end
    on_intel do
      url "https://github.com/shhac/agent-mcp-host/releases/download/v0.3.0/agent-mcp-host-darwin-amd64.tar.gz"
      sha256 "d0bba96b560d260c7b28ef6bbcc418320ba0b4d20277234763d6ff848321e9a3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-mcp-host/releases/download/v0.3.0/agent-mcp-host-linux-arm64.tar.gz"
      sha256 "81762b4df65ddc610aa5115c07af43591b621fa965b53a76cc2bc13d922124cb"
    end
    on_intel do
      url "https://github.com/shhac/agent-mcp-host/releases/download/v0.3.0/agent-mcp-host-linux-amd64.tar.gz"
      sha256 "ac1b5c7e6cc0096aa3574911a9e181ec85c8fdd3c2b9f375aeefd5462069e93f"
    end
  end

  def install
    bin.install "agent-mcp-host"
    # Installs shell completions via `agent-mcp-host completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-mcp-host", "completion")
  end

  test do
    assert_match "0.3.0", shell_output("#{bin}/agent-mcp-host --version")
    assert_match "MCP host", shell_output("#{bin}/agent-mcp-host --help")
    assert_match "#compdef agent-mcp-host", shell_output("#{bin}/agent-mcp-host completion zsh")
  end
end
