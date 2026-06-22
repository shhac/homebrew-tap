class AgentIncident < Formula
  desc "incident.io triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-incident"
  version "0.11.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-incident/releases/download/v0.11.1/agent-incident-darwin-arm64.tar.gz"
      sha256 "d679d5ceff8f58c6dbfc3809130bc4780324803b512280608ca7d91c467939f5"
    end
    on_intel do
      url "https://github.com/shhac/agent-incident/releases/download/v0.11.1/agent-incident-darwin-amd64.tar.gz"
      sha256 "3cbf9852853e1561e51cc4f4d3b2f339fe3a9a592100d4051e0f3002654399a8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-incident/releases/download/v0.11.1/agent-incident-linux-arm64.tar.gz"
      sha256 "f63f83de9b4923a60b37cc9a151b3a20ebb4fac08ebe8eca17bedb575dd8703d"
    end
    on_intel do
      url "https://github.com/shhac/agent-incident/releases/download/v0.11.1/agent-incident-linux-amd64.tar.gz"
      sha256 "e38b3c1994b752c035e18dbc19af79bef29e8afcfb384725830f15da415ffb49"
    end
  end

  def install
    bin.install "agent-incident"
    # Installs shell completions via `agent-incident completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-incident", "completion")
  end

  test do
    assert_match "0.11.1", shell_output("#{bin}/agent-incident --version")
    assert_match "incident.io triage CLI", shell_output("#{bin}/agent-incident --help")
    assert_match "#compdef agent-incident", shell_output("#{bin}/agent-incident completion zsh")
  end
end
