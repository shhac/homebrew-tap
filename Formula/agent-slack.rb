class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.14.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.14.0/agent-slack-darwin-arm64.tar.gz"
      sha256 "2a728204ca026be8fd47094b0da25919097970b3d583b7554323baa2c95c0543"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.14.0/agent-slack-darwin-amd64.tar.gz"
      sha256 "a0cc602d5a319aaebb52f453b81a352d15921d47b392bf7d2aeadb04b4b3aca3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.14.0/agent-slack-linux-arm64.tar.gz"
      sha256 "dc367f7c56d175b5453747c7867225b9b6a8dac915ebe98ad922975e19be15d0"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.14.0/agent-slack-linux-amd64.tar.gz"
      sha256 "d3245e7b5eae2832a3761728a7bd165514d5eba65e0b54f1d950dd53871bdbef"
    end
  end

  def install
    bin.install Dir["agent-slack-*"].first => "agent-slack"
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.14.0", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack usage")
  end
end
