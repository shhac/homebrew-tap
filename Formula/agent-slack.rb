class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.15.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.15.1/agent-slack-darwin-arm64.tar.gz"
      sha256 "944ec7c2ea26b3736a39567b1f10f0186d53d0cc1fa097cc8bc8f385e5314ea0"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.15.1/agent-slack-darwin-amd64.tar.gz"
      sha256 "5f0925171fcc1ac1b91f618d842bd98615dff1bd98076c65990993472533592b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.15.1/agent-slack-linux-arm64.tar.gz"
      sha256 "6a7b17608c0c666d7635ee51abd7e48b5c514145432e69dac8a8672f2f3e43a7"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.15.1/agent-slack-linux-amd64.tar.gz"
      sha256 "4b4cafcc59d6d240e05abe4d3ed61428505dcd288c64ee01b7961e40df666766"
    end
  end

  def install
    bin.install Dir["agent-slack-*"].first => "agent-slack"
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.15.1", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack usage")
  end
end
