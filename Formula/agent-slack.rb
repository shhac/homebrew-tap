class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.50.0/agent-slack-darwin-arm64.tar.gz"
      sha256 "dc200f6f9f6acadcf93364a94f5596dcbccf7dc2eb363592a5d9934964cfc5b3"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.50.0/agent-slack-darwin-amd64.tar.gz"
      sha256 "82cd2f532fb69b13722a49fd9bc01e96c89e76c1829688a1702d980489f5eeec"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.50.0/agent-slack-linux-arm64.tar.gz"
      sha256 "b14806c1b0c97e9facec70c5d8595b6b8d515d404ad756d892647657ac4ad86a"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.50.0/agent-slack-linux-amd64.tar.gz"
      sha256 "7c88c693f23a2554e7ce38966fdec374439da0746c8a7f7ce8b49393d26f4ff8"
    end
  end

  def install
    bin.install "agent-slack"
    # Installs shell completions via `agent-slack completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.50.0", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack --help")
    assert_match "#compdef agent-slack", shell_output("#{bin}/agent-slack completion zsh")
  end
end
