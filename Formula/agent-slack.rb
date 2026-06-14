class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.8.0/agent-slack-darwin-arm64.tar.gz"
      sha256 "0a82a7f8afdb1de7a9b0da1ebc3346b54bc51146397b178f5230d30eb7982041"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.8.0/agent-slack-darwin-amd64.tar.gz"
      sha256 "2a3dda040dcd976cdfe299447be75ba7bdb2ed498d0548ebf2c0aa95fda1db0f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.8.0/agent-slack-linux-arm64.tar.gz"
      sha256 "ec88616d458433a7c865c4580571721ea031ca391b24ea2d3fd2c90de05b3a44"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.8.0/agent-slack-linux-amd64.tar.gz"
      sha256 "7aa9fffbfdef1379cd14ce848266c11385853c15eacfca1d9f9a4dce875bde60"
    end
  end

  def install
    bin.install Dir["agent-slack-*"].first => "agent-slack"
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.8.0", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack usage")
  end
end
