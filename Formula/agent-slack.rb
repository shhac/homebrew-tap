class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.39.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.39.1/agent-slack-darwin-arm64.tar.gz"
      sha256 "6e226d435b72954805ae0e7df9101bec2481889f04a4238dbbd6c9cb68131317"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.39.1/agent-slack-darwin-amd64.tar.gz"
      sha256 "ee9af1222a094f72d2dc74e2dd6d0363136fda334ce677a5d5b66bc78ec8cdc5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.39.1/agent-slack-linux-arm64.tar.gz"
      sha256 "068a833ce8d856bf7f25547778e9248f8a6c5a44921e430191443f1fc2e2cd29"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.39.1/agent-slack-linux-amd64.tar.gz"
      sha256 "21fc82c3a8491debd4c94c53f758461f9788562f12b37202270a7f0ddfbd5b5c"
    end
  end

  def install
    bin.install "agent-slack"
    # Installs shell completions via `agent-slack completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.39.1", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack --help")
    assert_match "#compdef agent-slack", shell_output("#{bin}/agent-slack completion zsh")
  end
end
