class AgentMcpHost < Formula
  desc "One-origin MCP host for the agent-* CLI family"
  homepage "https://github.com/shhac/agent-mcp-host"
  version "0.6.3"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-mcp-host/releases/download/v0.6.3/agent-mcp-host-darwin-arm64.tar.gz"
      sha256 "e144669beeba912cf689db6ea4d64b4ac49cd290475bd2ee85277229a5fd6e97"
    end
    on_intel do
      url "https://github.com/shhac/agent-mcp-host/releases/download/v0.6.3/agent-mcp-host-darwin-amd64.tar.gz"
      sha256 "2294861df3390479e48c77ea59b2cfe1bbb46d6e126fa3e1cef7c6948540aa6d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-mcp-host/releases/download/v0.6.3/agent-mcp-host-linux-arm64.tar.gz"
      sha256 "2471c3ee4f5d436b74d14ff9dc9e47c3dfccc6a2af5b8948d7fc8ca5acb056b9"
    end
    on_intel do
      url "https://github.com/shhac/agent-mcp-host/releases/download/v0.6.3/agent-mcp-host-linux-amd64.tar.gz"
      sha256 "cd903279138cf816ce451e3d69f76b8863a08c0e1f2efc5929a594ad4195ad58"
    end
  end

  def install
    bin.install "agent-mcp-host"
    # Installs shell completions via `agent-mcp-host completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-mcp-host", "completion")
  end

  test do
    assert_match "0.6.3", shell_output("#{bin}/agent-mcp-host --version")
    assert_match "MCP host", shell_output("#{bin}/agent-mcp-host --help")
    assert_match "#compdef agent-mcp-host", shell_output("#{bin}/agent-mcp-host completion zsh")
  end
end
