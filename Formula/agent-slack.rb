class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.33.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.33.0/agent-slack-darwin-arm64.tar.gz"
      sha256 "4998fa6ce1a16c0581ce8b067a51ba878d28338b75702721c4d71efb844a1e5a"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.33.0/agent-slack-darwin-amd64.tar.gz"
      sha256 "3551806bd99d0209eb3e083c881282703332114a1a226df09f5630128d6556bd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.33.0/agent-slack-linux-arm64.tar.gz"
      sha256 "274592321f0ff09f43c08d32ce19169cf1ed541f12c7daef625c8cb351418b30"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.33.0/agent-slack-linux-amd64.tar.gz"
      sha256 "8746fc6ce0f55266849725a68afad9389ce4ecdb5d29b5f2f5ea95b7142aac13"
    end
  end

  def install
    bin.install "agent-slack"
    # Installs shell completions via `agent-slack completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.33.0", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack --help")
    assert_match "#compdef agent-slack", shell_output("#{bin}/agent-slack completion zsh")
  end
end
