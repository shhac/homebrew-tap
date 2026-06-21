class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.18.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.18.0/agent-slack-darwin-arm64.tar.gz"
      sha256 "b33cf198a6a685e178dc4edabd94636d099691a2771a6097f335e19274ae33ce"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.18.0/agent-slack-darwin-amd64.tar.gz"
      sha256 "4b9cff250b554bb008c52b4bd6a2ee32d334e758e9b5c68603e99d92dd8d4b98"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.18.0/agent-slack-linux-arm64.tar.gz"
      sha256 "e3b5ba198e25860b013e7ee8a7b92410f71bddc5146c4503bc25b191ecc6915c"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.18.0/agent-slack-linux-amd64.tar.gz"
      sha256 "87e7ee0415a76d1f30a61bc6e166634324146dbadb1368e766cdb1fcff0d07fe"
    end
  end

  def install
    bin.install Dir["agent-slack-*"].first => "agent-slack"
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.18.0", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack usage")
  end
end
