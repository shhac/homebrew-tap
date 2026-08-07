class AgentIncident < Formula
  desc "incident.io triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-incident"
  version "0.16.1"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-incident/releases/download/v0.16.1/agent-incident-darwin-arm64.tar.gz"
      sha256 "40a6e359d00b63bea9c49b7059488affdc25ebb4eab01829ed9d3e4a620a37ca"
    end
    on_intel do
      url "https://github.com/shhac/agent-incident/releases/download/v0.16.1/agent-incident-darwin-amd64.tar.gz"
      sha256 "dd6f7c3ff17bd0cfa662fe223bd1982bcc5ee5ea613cc3360c262e037835e4a5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-incident/releases/download/v0.16.1/agent-incident-linux-arm64.tar.gz"
      sha256 "0c6b20f986307dfa458d7cdd15d20347c078d83ef8c48da99dd06423f576c37c"
    end
    on_intel do
      url "https://github.com/shhac/agent-incident/releases/download/v0.16.1/agent-incident-linux-amd64.tar.gz"
      sha256 "850f3422776c1e016e6eecd297a3a864b5d5dede746a6e03d55390affc3ca937"
    end
  end

  def install
    bin.install "agent-incident"
    # Installs shell completions via `agent-incident completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-incident", "completion")
  end

  test do
    assert_match "0.16.1", shell_output("#{bin}/agent-incident --version")
    assert_match "incident.io triage CLI", shell_output("#{bin}/agent-incident --help")
    assert_match "#compdef agent-incident", shell_output("#{bin}/agent-incident completion zsh")
  end
end
