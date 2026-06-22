class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.26.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.26.0/agent-slack-darwin-arm64.tar.gz"
      sha256 "b817eec8f14555160a7409dc248615edfbc5af97010ef086a5197789cb7bc508"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.26.0/agent-slack-darwin-amd64.tar.gz"
      sha256 "e51fed7365e1202fa61a608efefdfdc48cf3fe81114ac073960bebaf467972ca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.26.0/agent-slack-linux-arm64.tar.gz"
      sha256 "00bf046ef90eac64c3b882eea34a5449884b673c9b45d9158c1dd547632e13a4"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.26.0/agent-slack-linux-amd64.tar.gz"
      sha256 "a1f3756f50c0f762193229fea251716ac53559a6aee3ae4cd5631335955e4ed6"
    end
  end

  def install
    bin.install "agent-slack"
    # Installs shell completions via `agent-slack completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.26.0", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack --help")
    assert_match "#compdef agent-slack", shell_output("#{bin}/agent-slack completion zsh")
  end
end
