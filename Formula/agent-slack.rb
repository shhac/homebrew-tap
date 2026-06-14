class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.9.0/agent-slack-darwin-arm64.tar.gz"
      sha256 "4a3391f57e46d0b97936cd97197d72f5c91f50ecad8de28accd8b5334185e5a7"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.9.0/agent-slack-darwin-amd64.tar.gz"
      sha256 "c8704e0f5cfd01fea4ebef2566fc86087f3df6a14b80fb023346074e0b96725f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.9.0/agent-slack-linux-arm64.tar.gz"
      sha256 "4a574bf39af862e7800407a5f635f0668f39aa696eb6bdee1c6f43f081c92b73"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.9.0/agent-slack-linux-amd64.tar.gz"
      sha256 "1588be84c7b5b08a585d5d391314214e81820b14553ed39d336b76d719a1ee61"
    end
  end

  def install
    bin.install Dir["agent-slack-*"].first => "agent-slack"
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.9.0", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack usage")
  end
end
