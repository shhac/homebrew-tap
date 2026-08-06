class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.47.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.47.0/agent-slack-darwin-arm64.tar.gz"
      sha256 "bb30718c76f07724ed0e127b4c7caf72764f7734dd523e767bf33b3520f4da9f"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.47.0/agent-slack-darwin-amd64.tar.gz"
      sha256 "55c592d3e3e74130a28f6862f8fefffed109f9c7d167c472d8e7838554dc2232"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.47.0/agent-slack-linux-arm64.tar.gz"
      sha256 "c1234504a9b140c56a8913e4d5c9794f4bc9752c22c08264b70eecbe1e76d947"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.47.0/agent-slack-linux-amd64.tar.gz"
      sha256 "ace96beed8dda72b206bf954f7aabfec756c794a95a7d4c8ec71a35a8c7509b7"
    end
  end

  def install
    bin.install "agent-slack"
    # Installs shell completions via `agent-slack completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.47.0", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack --help")
    assert_match "#compdef agent-slack", shell_output("#{bin}/agent-slack completion zsh")
  end
end
