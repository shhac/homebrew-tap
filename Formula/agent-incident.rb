class AgentIncident < Formula
  desc "incident.io triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-incident"
  version "0.14.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-incident/releases/download/v0.14.1/agent-incident-darwin-arm64.tar.gz"
      sha256 "540ab6444e6564063935456cd1879aa6981dd2318db837006857d7ca6ba4340f"
    end
    on_intel do
      url "https://github.com/shhac/agent-incident/releases/download/v0.14.1/agent-incident-darwin-amd64.tar.gz"
      sha256 "a1a5f1ac15c66ad4c566edf3e7049458b4b6dea7e89ad51dc174d8d962c0f0e0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-incident/releases/download/v0.14.1/agent-incident-linux-arm64.tar.gz"
      sha256 "3c3f4f497a25cdd01c7dd788e865e52e2cafd8a3e7622f067d167a1229378f35"
    end
    on_intel do
      url "https://github.com/shhac/agent-incident/releases/download/v0.14.1/agent-incident-linux-amd64.tar.gz"
      sha256 "c2260b4e97d4b10c55f5cf27b9d292ea8747f8dd53c069a334e4be83babd9c60"
    end
  end

  def install
    bin.install "agent-incident"
    # Installs shell completions via `agent-incident completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-incident", "completion")
  end

  test do
    assert_match "0.14.1", shell_output("#{bin}/agent-incident --version")
    assert_match "incident.io triage CLI", shell_output("#{bin}/agent-incident --help")
    assert_match "#compdef agent-incident", shell_output("#{bin}/agent-incident completion zsh")
  end
end
