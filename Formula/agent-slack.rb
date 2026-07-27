class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.45.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.45.0/agent-slack-darwin-arm64.tar.gz"
      sha256 "5719c980655b4253c278a3fb4c9a4bcba8a090268852d064251c992318c3fb73"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.45.0/agent-slack-darwin-amd64.tar.gz"
      sha256 "b75c774bd6f6c116e20834463ea235cb393b8cdb5684a4fb380f5076afa6a760"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.45.0/agent-slack-linux-arm64.tar.gz"
      sha256 "a7c28a18b8742a6f328dc331579a02913785d87c31f86447f505048f8eb52a2c"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.45.0/agent-slack-linux-amd64.tar.gz"
      sha256 "afc42201adcb5be704645c6868a2f3a40bff0c94805e8332855074dc22127796"
    end
  end

  def install
    bin.install "agent-slack"
    # Installs shell completions via `agent-slack completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.45.0", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack --help")
    assert_match "#compdef agent-slack", shell_output("#{bin}/agent-slack completion zsh")
  end
end
