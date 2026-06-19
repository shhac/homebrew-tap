class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.16.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.16.1/agent-slack-darwin-arm64.tar.gz"
      sha256 "5e6d0555b9dd361f1e26746c9ac50283ba98b725c4087439237fea8fd8e8870c"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.16.1/agent-slack-darwin-amd64.tar.gz"
      sha256 "6a75f5cd87d81f96aab00f99b8dbdfb2ed815178573f59b34db0a7f67a6742d5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.16.1/agent-slack-linux-arm64.tar.gz"
      sha256 "0680352cb8e32c7bc58b42dcbe1835c0dc973687cd176bc867368a89d548b57d"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.16.1/agent-slack-linux-amd64.tar.gz"
      sha256 "6994f98897b82e2e02c36d8010f0995d91a10af0642bfb6b3b8e2b22cab44e70"
    end
  end

  def install
    bin.install Dir["agent-slack-*"].first => "agent-slack"
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.16.1", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack usage")
  end
end
