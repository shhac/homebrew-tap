class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.11.0/agent-slack-darwin-arm64.tar.gz"
      sha256 "105bf6f3572d8e5a04be9a3df12f6eab5f60f9b4f8db31f4d3e2fb8f1f7ead7e"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.11.0/agent-slack-darwin-amd64.tar.gz"
      sha256 "86fb266b764b93011ff8c7a02417f98b69a1b0bf20374b9cbfd7c172702d4bf5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.11.0/agent-slack-linux-arm64.tar.gz"
      sha256 "455b3a16e6c37edf2e6b101c67f255c149f14bf74d4f634589fafd15468f52c8"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.11.0/agent-slack-linux-amd64.tar.gz"
      sha256 "6bd0199ba934a2e88cdefe7a9bef7c7e19f6be2b2f80b02247d4095dbf409ccd"
    end
  end

  def install
    bin.install Dir["agent-slack-*"].first => "agent-slack"
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.11.0", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack usage")
  end
end
