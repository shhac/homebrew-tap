class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.12.0/agent-slack-darwin-arm64.tar.gz"
      sha256 "74e481e698613e9381422dd9c22759fc610d73966acd144f7787a864e64827cd"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.12.0/agent-slack-darwin-amd64.tar.gz"
      sha256 "beb3226c701475c3a1593e6c6090af87a44b4d85512b7c2e5ec536ef9b1bdd55"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.12.0/agent-slack-linux-arm64.tar.gz"
      sha256 "63760286b20a29ce07f3e5f8cee3550c4ada916c6fd981e9518514a978a09691"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.12.0/agent-slack-linux-amd64.tar.gz"
      sha256 "b0b57936be2f2df0350dc3c3a752fe316411d0634632e97fb4ede968b15f1978"
    end
  end

  def install
    bin.install Dir["agent-slack-*"].first => "agent-slack"
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.12.0", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack usage")
  end
end
