class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.38.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.38.0/agent-slack-darwin-arm64.tar.gz"
      sha256 "90297d414639b4a5cdee6e4d0f48e2b4fd2af756478e7735786ec1e1a5f33485"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.38.0/agent-slack-darwin-amd64.tar.gz"
      sha256 "4a022e835d5adcb1a4f22464baac0d7032b2811673443d738636f15d10b8dea8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.38.0/agent-slack-linux-arm64.tar.gz"
      sha256 "9d58ac25d9bfba68b86b577a7816f9b923db9cdb408ad3c7fe9140e3bb02cc8a"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.38.0/agent-slack-linux-amd64.tar.gz"
      sha256 "1cce9b6b76f207b77cf86d09e43f42e25f82913dbedf5fa787a9978f408e765a"
    end
  end

  def install
    bin.install "agent-slack"
    # Installs shell completions via `agent-slack completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.38.0", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack --help")
    assert_match "#compdef agent-slack", shell_output("#{bin}/agent-slack completion zsh")
  end
end
