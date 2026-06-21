class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.19.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.19.0/agent-slack-darwin-arm64.tar.gz"
      sha256 "cc33d16b95dc28d7536fa60bb8abf20d0c7b74b20b368a36b6a1ee4d96846cae"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.19.0/agent-slack-darwin-amd64.tar.gz"
      sha256 "568599489b7192520820e4da36a5a81b1991f072f7e19e01a7101e730c6f7cfd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.19.0/agent-slack-linux-arm64.tar.gz"
      sha256 "f4f9f9655745cc57a0f8e71ce0c22ed17862257ec1707408216e4c0c002f26a1"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.19.0/agent-slack-linux-amd64.tar.gz"
      sha256 "fc0d1697a20581a13014c6362f2fe51472b886a1c212dcafec98cb4e8e5b0e1f"
    end
  end

  def install
    bin.install Dir["agent-slack-*"].first => "agent-slack"
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.19.0", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack usage")
  end
end
