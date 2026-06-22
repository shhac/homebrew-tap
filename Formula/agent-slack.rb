class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.24.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.24.1/agent-slack-darwin-arm64.tar.gz"
      sha256 "3b7e931a4891f8b0c2b47f80d3e51f8d18c92a89255d2d9db96d8a3c3b6faedd"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.24.1/agent-slack-darwin-amd64.tar.gz"
      sha256 "d42f789c232d99884b6240a882be16dfabac7391e08eaa8db7b03386e4631ca8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.24.1/agent-slack-linux-arm64.tar.gz"
      sha256 "028f4fae854dbe12c83a3b0d2d81d5fd757cbbe27ebff40e8f420174b631b182"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.24.1/agent-slack-linux-amd64.tar.gz"
      sha256 "fd31953f1ff08580d7b0e7a726f6558349f0a630fdae96fb4f783be3cb04dbd5"
    end
  end

  def install
    bin.install "agent-slack"
    # Installs shell completions via `agent-slack completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.24.1", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack --help")
    assert_match "#compdef agent-slack", shell_output("#{bin}/agent-slack completion zsh")
  end
end
