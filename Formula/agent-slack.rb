class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.37.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.37.0/agent-slack-darwin-arm64.tar.gz"
      sha256 "49df2fc277faff195bace21b52e0ecb285b517fce9ab06e93842284c28e7c1a3"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.37.0/agent-slack-darwin-amd64.tar.gz"
      sha256 "c94e5eaf083885e2a6f6800c5aee9f55095737da2ffff5de22af60f5053233c3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.37.0/agent-slack-linux-arm64.tar.gz"
      sha256 "2bc52bed44bb03ed5b96989cc9cf26644952638696fe62bd4db9018b8d4730e1"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.37.0/agent-slack-linux-amd64.tar.gz"
      sha256 "50135d21f486cc64b90d661a88346b36717347ce4dad7a0a77f29ddd8125fceb"
    end
  end

  def install
    bin.install "agent-slack"
    # Installs shell completions via `agent-slack completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.37.0", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack --help")
    assert_match "#compdef agent-slack", shell_output("#{bin}/agent-slack completion zsh")
  end
end
