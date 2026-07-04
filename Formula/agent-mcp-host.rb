class AgentMcpHost < Formula
  desc "One-origin MCP host for the agent-* CLI family"
  homepage "https://github.com/shhac/agent-mcp-host"
  version "0.5.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-mcp-host/releases/download/v0.5.0/agent-mcp-host-darwin-arm64.tar.gz"
      sha256 "33af39585722e92b8fbe7cdee4be691a2b9e97d3c04e86b381a36696b4cac6ce"
    end
    on_intel do
      url "https://github.com/shhac/agent-mcp-host/releases/download/v0.5.0/agent-mcp-host-darwin-amd64.tar.gz"
      sha256 "99bc42e0da2a8dbec26c28942be2c94f7227130cdb246e8b269c7c4876420886"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-mcp-host/releases/download/v0.5.0/agent-mcp-host-linux-arm64.tar.gz"
      sha256 "66ddd77eca2186d539291d91577e4d9ac926975857f89cde6662b1e76d01f729"
    end
    on_intel do
      url "https://github.com/shhac/agent-mcp-host/releases/download/v0.5.0/agent-mcp-host-linux-amd64.tar.gz"
      sha256 "434a7c3b09ef795b24097b8184911ae2c89a5caa98afd8fcf3ca098cdb5e85fb"
    end
  end

  def install
    bin.install "agent-mcp-host"
    # Installs shell completions via `agent-mcp-host completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-mcp-host", "completion")
  end

  test do
    assert_match "0.5.0", shell_output("#{bin}/agent-mcp-host --version")
    assert_match "MCP host", shell_output("#{bin}/agent-mcp-host --help")
    assert_match "#compdef agent-mcp-host", shell_output("#{bin}/agent-mcp-host completion zsh")
  end
end
