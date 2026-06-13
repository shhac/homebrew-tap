class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.5.0/agent-slack-darwin-arm64.tar.gz"
      sha256 "d4918c842cd757299dfeb812f19971bceee839ee0e69c90ca4a42098c63fe1c1"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.5.0/agent-slack-darwin-amd64.tar.gz"
      sha256 "cf241e8b0ed6ddb490a6655d6d07f0d38013a28c73764c892d668c796fec1822"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.5.0/agent-slack-linux-arm64.tar.gz"
      sha256 "5f0fce79d78980b05779ed81dc5a51ce7b05b9b4dfa93524f0f48d65f44c37a0"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.5.0/agent-slack-linux-amd64.tar.gz"
      sha256 "a58c9b1fe0a074d616a8e7ad216b3d1979bc30cf0afcf0d9f373df8f64726d20"
    end
  end

  def install
    bin.install Dir["agent-slack-*"].first => "agent-slack"
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.5.0", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack usage")
  end
end
