class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.7.0/agent-slack-darwin-arm64.tar.gz"
      sha256 "8789bcb1e95cb7750662f81f142270b54a95036980ca0972ae0bbeaf722cb58b"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.7.0/agent-slack-darwin-amd64.tar.gz"
      sha256 "4b4c21dbdb5322f7d10194c0840ad5d91d513b0ad4d084396506e89eebbfebad"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.7.0/agent-slack-linux-arm64.tar.gz"
      sha256 "baab72fc75030379186275e2a1abd6d141805890e62bc51af47c84c91567ebc9"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.7.0/agent-slack-linux-amd64.tar.gz"
      sha256 "5b161ff6ee150de13508cd5389e30196b1a1f148738c7c17a3eba19ed9a9a7f2"
    end
  end

  def install
    bin.install Dir["agent-slack-*"].first => "agent-slack"
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.7.0", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack usage")
  end
end
