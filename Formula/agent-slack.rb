class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.5.1/agent-slack-darwin-arm64.tar.gz"
      sha256 "e0a581f9b35c8ad4cf031f1bcf7d2d7ca21ae8b49529966b0b855e5f1e6a043d"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.5.1/agent-slack-darwin-amd64.tar.gz"
      sha256 "72b626dbaae2c97b213a18cf9b503865103f62cec18412410270b28d4a716001"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.5.1/agent-slack-linux-arm64.tar.gz"
      sha256 "d6267d37ff8ca3e54667ce4ee8598c78a3ea9b16f77da08a07dbedf1acbbf821"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.5.1/agent-slack-linux-amd64.tar.gz"
      sha256 "0a3e3c084b28dae0350931d54ab20f77e92abfec6a8569a545ab36baac4874d0"
    end
  end

  def install
    bin.install Dir["agent-slack-*"].first => "agent-slack"
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.5.1", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack usage")
  end
end
