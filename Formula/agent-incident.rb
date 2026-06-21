class AgentIncident < Formula
  desc "incident.io triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-incident"
  version "0.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-incident/releases/download/v0.6.1/agent-incident-darwin-arm64.tar.gz"
      sha256 "b835a9f44fb75981e69e762d988fb205825ca877ff6ef23415bba6efbb06bf5f"
    end
    on_intel do
      url "https://github.com/shhac/agent-incident/releases/download/v0.6.1/agent-incident-darwin-amd64.tar.gz"
      sha256 "2ae4a261eb7dd2a9799bb249356cd27898ec08395f5c8904d8d0b31d427f7fa9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-incident/releases/download/v0.6.1/agent-incident-linux-arm64.tar.gz"
      sha256 "7efe0aaeace20823ee1141c169821db45c73c5a6563a2c01f22d3a8053280c9b"
    end
    on_intel do
      url "https://github.com/shhac/agent-incident/releases/download/v0.6.1/agent-incident-linux-amd64.tar.gz"
      sha256 "4d9937e11234222f3b5c19866f3a8781d4f624b54a795f14116c08d262637c9a"
    end
  end

  def install
    bin.install "agent-incident"
    # Installs shell completions via `agent-incident completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-incident", "completion")
  end

  test do
    assert_match "0.6.1", shell_output("#{bin}/agent-incident --version")
    assert_match "incident.io triage CLI", shell_output("#{bin}/agent-incident --help")
    assert_match "#compdef agent-incident", shell_output("#{bin}/agent-incident completion zsh")
  end
end
