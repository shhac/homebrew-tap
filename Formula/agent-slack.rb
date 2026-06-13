class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.4.0/agent-slack-darwin-arm64.tar.gz"
      sha256 "507886593ec787dd3c063813cafaa4d6db6e0e0c67e56d315cb4ede799d9c153"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.4.0/agent-slack-darwin-amd64.tar.gz"
      sha256 "6313f957805a44795b522e033590ba5dd2abd49f1ec7ff24909d47f381a0a72f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.4.0/agent-slack-linux-arm64.tar.gz"
      sha256 "7b51d61f6ad3228dbb53ccbba5fd0f2a1c7451d850ef98cb53ae45d253d61d3d"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.4.0/agent-slack-linux-amd64.tar.gz"
      sha256 "cacd2702938af96f7b0d3db7f262cdd5e570588fabdc502cba971f0e7f08c339"
    end
  end

  def install
    bin.install Dir["agent-slack-*"].first => "agent-slack"
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.4.0", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack usage")
  end
end
