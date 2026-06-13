class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.5.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.5.4/agent-slack-darwin-arm64.tar.gz"
      sha256 "742289b94740d857ab4918579a3e9efc3094bf5facf2b4dd48db8a1c0002c756"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.5.4/agent-slack-darwin-amd64.tar.gz"
      sha256 "eebb419677f662fc6d355e00eec3c21cd242cb15fff54c42e397b3422123b5fb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.5.4/agent-slack-linux-arm64.tar.gz"
      sha256 "922c50e43d56fd86e58c4a65b7d087a6ceea1d571c647a5512babad97d2bf88f"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.5.4/agent-slack-linux-amd64.tar.gz"
      sha256 "dc10ce2958ce82ec5f291836f6f2618f8db45eb9457ce58d90c8df1b21162ec9"
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
