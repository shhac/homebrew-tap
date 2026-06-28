class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.30.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.30.0/agent-slack-darwin-arm64.tar.gz"
      sha256 "aa9b66a583aace840e6d336ff47a9953f4ce840611480c06aac8527146cfc20f"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.30.0/agent-slack-darwin-amd64.tar.gz"
      sha256 "5433c5655287135136616443fbca6a298be4f1d1743633105a886ea74c31ab2d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.30.0/agent-slack-linux-arm64.tar.gz"
      sha256 "f5631e8f872d173957d64cd0a5425e7258d35a3d3ee82d715dcf4e1216911821"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.30.0/agent-slack-linux-amd64.tar.gz"
      sha256 "4921e2b63fc7ebd0c85ea8af226815dd0374d7d486ae169d3a48ad2995bdd093"
    end
  end

  def install
    bin.install "agent-slack"
    # Installs shell completions via `agent-slack completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.30.0", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack --help")
    assert_match "#compdef agent-slack", shell_output("#{bin}/agent-slack completion zsh")
  end
end
