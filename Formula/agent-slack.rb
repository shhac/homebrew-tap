class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.19.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.19.1/agent-slack-darwin-arm64.tar.gz"
      sha256 "32a9284bfacf6d01235bac721036145c8c17581e7f3b6662ea41c277fbb15e1e"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.19.1/agent-slack-darwin-amd64.tar.gz"
      sha256 "53c0454d88d305f9d150eefe1e02ef2e0c135067a5af6de79afe40a6d91100e1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.19.1/agent-slack-linux-arm64.tar.gz"
      sha256 "437f5a900e0f24516af8a1180f23f6720caf1d45979b43c24edc55a0aab269dd"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.19.1/agent-slack-linux-amd64.tar.gz"
      sha256 "e14f1de152654a223e39947ff9d4953568bd4a43043c0d33238c05610e134839"
    end
  end

  def install
    bin.install "agent-slack"
    # Installs shell completions via `agent-slack completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.19.1", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack --help")
    assert_match "#compdef agent-slack", shell_output("#{bin}/agent-slack completion zsh")
  end
end
