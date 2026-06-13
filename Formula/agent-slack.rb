class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.5.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.5.4/agent-slack-darwin-arm64.tar.gz"
      sha256 "76edb582f743158cea25b266e5a1e7ba7c672fefcbcac2fa835574cfe470ed6b"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.5.4/agent-slack-darwin-amd64.tar.gz"
      sha256 "89069d388b60b9cac201e984cedf31739d1bbd5de9c96347ff12eaba9a8406ff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.5.4/agent-slack-linux-arm64.tar.gz"
      sha256 "d1c58e7786e19c6d35a2d3e8fb049ac3ea00091cfbff2c2f7c9a554a0f05cc1c"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.5.4/agent-slack-linux-amd64.tar.gz"
      sha256 "17b19429622cf382beecc8cc1322648f03dfd1357d3e0cae47c21fea14a5a7ef"
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
