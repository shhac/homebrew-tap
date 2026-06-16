class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.13.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.13.0/agent-slack-darwin-arm64.tar.gz"
      sha256 "620da8f06c3cee8bc3950ebe7b1fb90f49d02f65000c64d84a1033654e508af8"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.13.0/agent-slack-darwin-amd64.tar.gz"
      sha256 "7c7d9cd366508e325b8616a396649d17fb99d6c33bec28cbc5a7393f27db9102"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.13.0/agent-slack-linux-arm64.tar.gz"
      sha256 "3120d14d87910338e7bb1d99f5fec567b9829cc8e1f815434a86cf3a17f1f613"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.13.0/agent-slack-linux-amd64.tar.gz"
      sha256 "190ebae7e0472d3bda0596b76c5f58d479ceaea2288d964605aacb1c3e559aeb"
    end
  end

  def install
    bin.install Dir["agent-slack-*"].first => "agent-slack"
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.13.0", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack usage")
  end
end
