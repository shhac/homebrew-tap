class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.1.0/agent-slack-darwin-arm64.tar.gz"
      sha256 "2d1b0ceb7fdf7336d5d16d2394cc9c167a8465b82b91e266ae0c4975b4bea55a"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.1.0/agent-slack-darwin-amd64.tar.gz"
      sha256 "86bef6cfa3aa713ccaa0f9692e1b8c9fde4560e8fd8bf54258188c19cbcd9252"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.1.0/agent-slack-linux-arm64.tar.gz"
      sha256 "e7b120dc26d2d7fd5f9a02d6dd01b79200d23e682394660d25101c457a29fdbd"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.1.0/agent-slack-linux-amd64.tar.gz"
      sha256 "e119223bf97fbfbd5de0a5f8a5acd0df62f403500527276986dfe9133edee3e7"
    end
  end

  def install
    bin.install Dir["agent-slack-*"].first => "agent-slack"
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack usage")
  end
end
