class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.5.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.5.5/agent-slack-darwin-arm64.tar.gz"
      sha256 "9e04f2bafaf20f106cbd940f086baac797cbd94eb21fb933c0253f5cf3baad68"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.5.5/agent-slack-darwin-amd64.tar.gz"
      sha256 "1e344cf8a1732f4cd53b37369d92ee7a764af09bd3d944ba6675df940603dc2d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.5.5/agent-slack-linux-arm64.tar.gz"
      sha256 "b34f771dbd3f32893277f10122aa58d9267d2a779db70099cd4851ec18947974"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.5.5/agent-slack-linux-amd64.tar.gz"
      sha256 "98d4620ed0d4774fbf64f22c6a82c603bd6941791d28d3e67298fe4e0944d2df"
    end
  end

  def install
    bin.install Dir["agent-slack-*"].first => "agent-slack"
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.5.5", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack usage")
  end
end
