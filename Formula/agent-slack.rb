class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.15.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.15.0/agent-slack-darwin-arm64.tar.gz"
      sha256 "b288edbbe992dd9302e5640d3fb47e4d2c81596d187858083ccb4fd246d3db2e"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.15.0/agent-slack-darwin-amd64.tar.gz"
      sha256 "c484560f09e48819a077bfac4411d9c6cfba0ee448c406d508bb6bc59234d4fa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.15.0/agent-slack-linux-arm64.tar.gz"
      sha256 "4c6874a908d95ee6461f032185d692338cac54409071d41d53af90f0da286bd7"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.15.0/agent-slack-linux-amd64.tar.gz"
      sha256 "c9bb29912d5648d5af356ea97910fb445a70e75fac63f475373841b4b551059a"
    end
  end

  def install
    bin.install Dir["agent-slack-*"].first => "agent-slack"
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.15.0", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack usage")
  end
end
