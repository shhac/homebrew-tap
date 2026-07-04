class AgentMcpHost < Formula
  desc "One-origin MCP host for the agent-* CLI family"
  homepage "https://github.com/shhac/agent-mcp-host"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-mcp-host/releases/download/v0.2.1/agent-mcp-host-darwin-arm64.tar.gz"
      sha256 "e2bb772b0ddf5effbb94e89cc1c2abd2e36b8f1cec13dd238e7ca0909137f767"
    end
    on_intel do
      url "https://github.com/shhac/agent-mcp-host/releases/download/v0.2.1/agent-mcp-host-darwin-amd64.tar.gz"
      sha256 "705df23d92f8e03d48ee6be877eb55a049821cb77cebbc6132b67fb9eb12490f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-mcp-host/releases/download/v0.2.1/agent-mcp-host-linux-arm64.tar.gz"
      sha256 "de9e0b2a3225c60f4387a26755de42128e0bef311ac45aae04e388933b21b2e3"
    end
    on_intel do
      url "https://github.com/shhac/agent-mcp-host/releases/download/v0.2.1/agent-mcp-host-linux-amd64.tar.gz"
      sha256 "c18852f771d05e5d3d305156a11263de342f2f38e8f928370100a69fdac72d92"
    end
  end

  def install
    bin.install "agent-mcp-host"
    # Installs shell completions via `agent-mcp-host completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-mcp-host", "completion")
  end

  test do
    assert_match "0.2.1", shell_output("#{bin}/agent-mcp-host --version")
    assert_match "MCP host", shell_output("#{bin}/agent-mcp-host --help")
    assert_match "#compdef agent-mcp-host", shell_output("#{bin}/agent-mcp-host completion zsh")
  end
end
