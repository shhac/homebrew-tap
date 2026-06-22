class AgentIncident < Formula
  desc "incident.io triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-incident"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-incident/releases/download/v0.8.0/agent-incident-darwin-arm64.tar.gz"
      sha256 "a784bed4a862e3abacb31c2fc302f99826e8e7d881bf80157949efb6be61a2cc"
    end
    on_intel do
      url "https://github.com/shhac/agent-incident/releases/download/v0.8.0/agent-incident-darwin-amd64.tar.gz"
      sha256 "8b36e41547abe650ead32f7bc28d98a8380f0b384633ab03d61f05eebdab9e9b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-incident/releases/download/v0.8.0/agent-incident-linux-arm64.tar.gz"
      sha256 "d6329d4d2785c05a256044595d4740bea691a678d76e122a8fe15216392654a5"
    end
    on_intel do
      url "https://github.com/shhac/agent-incident/releases/download/v0.8.0/agent-incident-linux-amd64.tar.gz"
      sha256 "8d6dba1a0032b02d6a1ccdaea7a971fddc57b8bcc35be3e59e936353ba3054f8"
    end
  end

  def install
    bin.install "agent-incident"
    # Installs shell completions via `agent-incident completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-incident", "completion")
  end

  test do
    assert_match "0.8.0", shell_output("#{bin}/agent-incident --version")
    assert_match "incident.io triage CLI", shell_output("#{bin}/agent-incident --help")
    assert_match "#compdef agent-incident", shell_output("#{bin}/agent-incident completion zsh")
  end
end
