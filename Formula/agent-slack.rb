class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.41.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.41.0/agent-slack-darwin-arm64.tar.gz"
      sha256 "336d586be0d21cd1ac2340824e562824470fffafda0ed122ff785fd8a7eceefd"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.41.0/agent-slack-darwin-amd64.tar.gz"
      sha256 "13ab4c8fccb52ec1b5124785c31952ebc3fa453e7cd54b953309802cbdf1a981"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.41.0/agent-slack-linux-arm64.tar.gz"
      sha256 "e0300cf96f81953ee70886d3a94cd905f4b097f4e4debe668cf7f69d46940ec0"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.41.0/agent-slack-linux-amd64.tar.gz"
      sha256 "d45477e0d6c3b737387f282857df5a5938ee0d1a22327bc8cdb0ba8d99314a21"
    end
  end

  def install
    bin.install "agent-slack"
    # Installs shell completions via `agent-slack completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.41.0", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack --help")
    assert_match "#compdef agent-slack", shell_output("#{bin}/agent-slack completion zsh")
  end
end
