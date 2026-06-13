class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.3.1/agent-slack-darwin-arm64.tar.gz"
      sha256 "de9ad1cdafe1d243135836b2a77ab52635dd92bf3629fee6c671fa487945d4b3"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.3.1/agent-slack-darwin-amd64.tar.gz"
      sha256 "981e041b0bc2c1e986c37cee6592d3c207a634b571abc076baccc07f3fc2d430"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.3.1/agent-slack-linux-arm64.tar.gz"
      sha256 "eeb570e952504022b0409d142ca018392e9c2c1efce138cc8d42a081c38faccc"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.3.1/agent-slack-linux-amd64.tar.gz"
      sha256 "b60653851de5718011ef36dbcaed455249156654eb0dc0c360d0dad0bd8d70e8"
    end
  end

  def install
    bin.install Dir["agent-slack-*"].first => "agent-slack"
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.3.1", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack usage")
  end
end
