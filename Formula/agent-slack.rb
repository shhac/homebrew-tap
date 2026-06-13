class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.2.0/agent-slack-darwin-arm64.tar.gz"
      sha256 "fc177dfea7a81931106a53f6dbbd0d1bbc061b3870c903b0d853a949bcd69bb2"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.2.0/agent-slack-darwin-amd64.tar.gz"
      sha256 "2e509e24fcec8608b5847d225283f3b70f6d4ad60e07e89f889e58aaf37783ee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.2.0/agent-slack-linux-arm64.tar.gz"
      sha256 "82bf3c0681768a2cba2f0b6f57a47341d81b380a69f8658d8bc06d08b9c297ca"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.2.0/agent-slack-linux-amd64.tar.gz"
      sha256 "e526a3a4e052cef2485a5e1f0851a3dd2265eb9f6e28ddbdd39c685e4ccde1f3"
    end
  end

  def install
    bin.install Dir["agent-slack-*"].first => "agent-slack"
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.2.0", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack usage")
  end
end
