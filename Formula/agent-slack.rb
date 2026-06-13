class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.5.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.5.4/agent-slack-darwin-arm64.tar.gz"
      sha256 "3458aebbf8a289cd5d1472f9007680df33a523d426adc3f41e53016239a5c63d"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.5.4/agent-slack-darwin-amd64.tar.gz"
      sha256 "a9f94c0469622939a8aa7a2b5c8e803d67e9b54aabd553bb693df7eab72ac097"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.5.4/agent-slack-linux-arm64.tar.gz"
      sha256 "8200c9473c3981a981c728ebe566918df4f0d7e2a2976bc9493f582b35ffca61"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.5.4/agent-slack-linux-amd64.tar.gz"
      sha256 "27a47228eaba262b86992e3b60e00ca1ade362b63685e5e1cbcca3b49e75955b"
    end
  end

  def install
    bin.install Dir["agent-slack-*"].first => "agent-slack"
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.5.4", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack usage")
  end
end
