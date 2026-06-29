class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.31.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.31.0/agent-slack-darwin-arm64.tar.gz"
      sha256 "7d4d1683b7a4c30e2447cf818612f6bb53c061be2c99324686476385e82f1ed7"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.31.0/agent-slack-darwin-amd64.tar.gz"
      sha256 "b74fda2cca7027fc3d5de4cd4b93b56012fbfb202e4d17c89d966b23f0e8d62c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.31.0/agent-slack-linux-arm64.tar.gz"
      sha256 "14bc338432ee96b2061fb8cdd02bfcd950f7df508c4c695dde9cd29fbdbce3ef"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.31.0/agent-slack-linux-amd64.tar.gz"
      sha256 "b884a92e40714446d354ac145b485817c37f431a7c73d4e882f1eb11c0c150a1"
    end
  end

  def install
    bin.install "agent-slack"
    # Installs shell completions via `agent-slack completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.31.0", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack --help")
    assert_match "#compdef agent-slack", shell_output("#{bin}/agent-slack completion zsh")
  end
end
