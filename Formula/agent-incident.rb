class AgentIncident < Formula
  desc "incident.io triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-incident"
  version "0.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-incident/releases/download/v0.10.0/agent-incident-darwin-arm64.tar.gz"
      sha256 "60bb9acc5ea9e034222a7a45778177c78c53c3321c0422c1af182ff1966cb737"
    end
    on_intel do
      url "https://github.com/shhac/agent-incident/releases/download/v0.10.0/agent-incident-darwin-amd64.tar.gz"
      sha256 "bfd0d0f6696d2a220c307461d5e1e5cec33ea788b4041ca827687cec03355d42"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-incident/releases/download/v0.10.0/agent-incident-linux-arm64.tar.gz"
      sha256 "b299e546539136fd31cd43221a99768ba110e74eb2c1d433c1caccd0a064e6bb"
    end
    on_intel do
      url "https://github.com/shhac/agent-incident/releases/download/v0.10.0/agent-incident-linux-amd64.tar.gz"
      sha256 "3e4d5449a6d56d458390b7e6eb45bb2bb259478717ac55010cb5f02c3b9592c4"
    end
  end

  def install
    bin.install "agent-incident"
    # Installs shell completions via `agent-incident completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-incident", "completion")
  end

  test do
    assert_match "0.10.0", shell_output("#{bin}/agent-incident --version")
    assert_match "incident.io triage CLI", shell_output("#{bin}/agent-incident --help")
    assert_match "#compdef agent-incident", shell_output("#{bin}/agent-incident completion zsh")
  end
end
