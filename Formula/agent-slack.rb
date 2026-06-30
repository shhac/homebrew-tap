class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.35.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.35.0/agent-slack-darwin-arm64.tar.gz"
      sha256 "07a0a29ed2a060667e8829931b3ba2969f908b565b6ad9848b93f777f436adfa"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.35.0/agent-slack-darwin-amd64.tar.gz"
      sha256 "31dcb9553a54980b08720482f0cdfdfb5725fc33e1f66d68107ce8fa8913e4bf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.35.0/agent-slack-linux-arm64.tar.gz"
      sha256 "ed82fa704f5d452e498943abb0eeaae8fa727ec5b17559f4d21cd18362dfbf11"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.35.0/agent-slack-linux-amd64.tar.gz"
      sha256 "f9f92251676154ad047af59c9d26ac17fdd85b65f3dd65314f470aff488815b5"
    end
  end

  def install
    bin.install "agent-slack"
    # Installs shell completions via `agent-slack completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.35.0", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack --help")
    assert_match "#compdef agent-slack", shell_output("#{bin}/agent-slack completion zsh")
  end
end
