class AgentIncident < Formula
  desc "incident.io triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-incident"
  version "0.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-incident/releases/download/v0.11.0/agent-incident-darwin-arm64.tar.gz"
      sha256 "b59574748808b43f83293e0a44c6dbb3f408c3f5d4e56d235aa87760e45f485e"
    end
    on_intel do
      url "https://github.com/shhac/agent-incident/releases/download/v0.11.0/agent-incident-darwin-amd64.tar.gz"
      sha256 "cb2b46c8346ba4311b876e7ffb0fe458d1cefc842314c9ca3b40ec99d47138c9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-incident/releases/download/v0.11.0/agent-incident-linux-arm64.tar.gz"
      sha256 "20ecfef3204b237255bf733e523e03fc7be4a2955d3269297329a7cc9ecca1ea"
    end
    on_intel do
      url "https://github.com/shhac/agent-incident/releases/download/v0.11.0/agent-incident-linux-amd64.tar.gz"
      sha256 "1df77b07fa3f3487d9b62c84e22cd58fef02cdbdb2973e413bd2e921c6ee0381"
    end
  end

  def install
    bin.install "agent-incident"
    # Installs shell completions via `agent-incident completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-incident", "completion")
  end

  test do
    assert_match "0.11.0", shell_output("#{bin}/agent-incident --version")
    assert_match "incident.io triage CLI", shell_output("#{bin}/agent-incident --help")
    assert_match "#compdef agent-incident", shell_output("#{bin}/agent-incident completion zsh")
  end
end
