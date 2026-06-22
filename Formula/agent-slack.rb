class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.24.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.24.0/agent-slack-darwin-arm64.tar.gz"
      sha256 "b65e24f5ca220845c2f2f5043df0dd0615c3104ed74adbbf524a7fefa86c3335"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.24.0/agent-slack-darwin-amd64.tar.gz"
      sha256 "a3fa35d1a8d5ceec9b446a10ec99512902494eae50bd1c84f2d554896fe6c157"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.24.0/agent-slack-linux-arm64.tar.gz"
      sha256 "6afd52b4cd75ea056370dd770abeb41209ef1b4bb808ab192bdcb3ff6ce05937"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.24.0/agent-slack-linux-amd64.tar.gz"
      sha256 "67ab7c09c10ad575042430bdf3277729709e2752193645b477bf7f0e4417587c"
    end
  end

  def install
    bin.install "agent-slack"
    # Installs shell completions via `agent-slack completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.24.0", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack --help")
    assert_match "#compdef agent-slack", shell_output("#{bin}/agent-slack completion zsh")
  end
end
