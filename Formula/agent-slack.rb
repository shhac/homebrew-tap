class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.16.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.16.0/agent-slack-darwin-arm64.tar.gz"
      sha256 "8aeaa98f396fcbf47f7dc8307ce0d3c1299da13ab31eaea3057de7e4ad606f32"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.16.0/agent-slack-darwin-amd64.tar.gz"
      sha256 "07b3e9f6803c2ce4bd0598aa88b717224eebc5120f79d99893070d349ce7e0a7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.16.0/agent-slack-linux-arm64.tar.gz"
      sha256 "e02bd0cee2269807dcf4de7b4acded10fb95885995c3db3b584cdeb8c0bc6461"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.16.0/agent-slack-linux-amd64.tar.gz"
      sha256 "7dbd5dc524fb6cf04cd098cd1b211e7ca3830dbaace07dd220503f97a129dcc0"
    end
  end

  def install
    bin.install Dir["agent-slack-*"].first => "agent-slack"
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.16.0", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack usage")
  end
end
