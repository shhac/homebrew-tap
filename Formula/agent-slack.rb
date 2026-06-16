class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.14.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.14.1/agent-slack-darwin-arm64.tar.gz"
      sha256 "c233e9b49071eb374aec9ae0d4fa377c5d7ed31f9c6a1c55b3de4acb2cc84e33"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.14.1/agent-slack-darwin-amd64.tar.gz"
      sha256 "ae6f54e6fba10ae650c37764e97d314f6ec09847ddf660c0f714ef9dae800d11"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.14.1/agent-slack-linux-arm64.tar.gz"
      sha256 "2bebc1cd3b76dd7b894a2a7893a7f3d2c5b92d266273aa9dfd66cb2aedc4c803"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.14.1/agent-slack-linux-amd64.tar.gz"
      sha256 "88b828822a1703dc0db313d757d6a7610c07d590fa1b68ffe1162112fed8ad61"
    end
  end

  def install
    bin.install Dir["agent-slack-*"].first => "agent-slack"
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.14.1", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack usage")
  end
end
