class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.5.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.5.2/agent-slack-darwin-arm64.tar.gz"
      sha256 "675c0bbf077b2b4c5e4646748e81c69822a2c48be34f5c9e98e99c9faa82d53f"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.5.2/agent-slack-darwin-amd64.tar.gz"
      sha256 "5a74676c646a8105bb0592385ae251fbcb96be34b309c2a9452bb02482acf8e5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.5.2/agent-slack-linux-arm64.tar.gz"
      sha256 "56cdf711a972782b872b3a47867b95dbfa7d462d03704d4c924af0d255562413"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.5.2/agent-slack-linux-amd64.tar.gz"
      sha256 "85ce85e4dc5ef470e63e094f4f8b94b298506d851f2556fd8f4823220df3b50b"
    end
  end

  def install
    bin.install Dir["agent-slack-*"].first => "agent-slack"
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.5.2", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack usage")
  end
end
