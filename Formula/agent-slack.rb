class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.5.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.5.3/agent-slack-darwin-arm64.tar.gz"
      sha256 "7709cc2a5ee6c400b14fec2b3cce301bb175d7d2de57fd99dbdb36f2eb5a84a7"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.5.3/agent-slack-darwin-amd64.tar.gz"
      sha256 "fea99804f4f07fed21ce4ad6b108accfafc26298225c7ae8e9d63e289c0dea39"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.5.3/agent-slack-linux-arm64.tar.gz"
      sha256 "b6dc0e6cf3291506f6ccf671d6ab8acba135083de26c1b9ac37c96de8642e380"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.5.3/agent-slack-linux-amd64.tar.gz"
      sha256 "ebde10a93eb2cf0092523e209705a7f2b87290ce170e786f6043d4cf3d6b66e6"
    end
  end

  def install
    bin.install Dir["agent-slack-*"].first => "agent-slack"
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.5.3", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack usage")
  end
end
