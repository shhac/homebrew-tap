class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.31.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.31.1/agent-slack-darwin-arm64.tar.gz"
      sha256 "2c765172fe5139caf660a2310039f490491008752c8d211b64e20a35a4476743"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.31.1/agent-slack-darwin-amd64.tar.gz"
      sha256 "97f0a703d83b61370ec7249a8e762d1a89cf38e6554ac1aab768fc7d2f7bd2aa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.31.1/agent-slack-linux-arm64.tar.gz"
      sha256 "687f03a90ce4d9ff0f804b7362fb55293b309e28f06509cfa0baa321a90a89b0"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.31.1/agent-slack-linux-amd64.tar.gz"
      sha256 "218db99ca6842d3d640264c0be679b67a7c02c46b42109959fde4ae938a9f32e"
    end
  end

  def install
    bin.install "agent-slack"
    # Installs shell completions via `agent-slack completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.31.1", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack --help")
    assert_match "#compdef agent-slack", shell_output("#{bin}/agent-slack completion zsh")
  end
end
