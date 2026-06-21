class AgentIncident < Formula
  desc "incident.io triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-incident"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-incident/releases/download/v0.7.0/agent-incident-darwin-arm64.tar.gz"
      sha256 "f25bdafd34ccf6cac078c4a1556afeff66a1642d8536805ca0d6e4ec912645b6"
    end
    on_intel do
      url "https://github.com/shhac/agent-incident/releases/download/v0.7.0/agent-incident-darwin-amd64.tar.gz"
      sha256 "8e2f18e98e212f301fde4224f4d3067957df152bb52344ae41696c365647de00"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-incident/releases/download/v0.7.0/agent-incident-linux-arm64.tar.gz"
      sha256 "81d04e1c4c577e23e93f1a13c2bec5c338bf30201b5d07baff2f28f64ad230f1"
    end
    on_intel do
      url "https://github.com/shhac/agent-incident/releases/download/v0.7.0/agent-incident-linux-amd64.tar.gz"
      sha256 "73fe819646b37c70584845dfe8117316f8bb807e693a24b18ba36a27c71d6607"
    end
  end

  def install
    bin.install "agent-incident"
    # Installs shell completions via `agent-incident completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-incident", "completion")
  end

  test do
    assert_match "0.7.0", shell_output("#{bin}/agent-incident --version")
    assert_match "incident.io triage CLI", shell_output("#{bin}/agent-incident --help")
    assert_match "#compdef agent-incident", shell_output("#{bin}/agent-incident completion zsh")
  end
end
