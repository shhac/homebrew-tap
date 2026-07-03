class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.39.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.39.0/agent-slack-darwin-arm64.tar.gz"
      sha256 "ab09872fc58c6e797e09d1f4b515a32be8cc2bd81e0c056debd933436d0516d3"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.39.0/agent-slack-darwin-amd64.tar.gz"
      sha256 "c9a9ca3793a63c75d2fb4fb8ce8c19dca7c4b29e3c8b6c6425106b59b00db45a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.39.0/agent-slack-linux-arm64.tar.gz"
      sha256 "f113f4d81e9cd4442b8a56ea9b9fe36fc973667aed05f490cae35ca22f43235a"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.39.0/agent-slack-linux-amd64.tar.gz"
      sha256 "177325039351a3186701f1755eb0cd1a355859ce9145ac9c7e17819b1a224025"
    end
  end

  def install
    bin.install "agent-slack"
    # Installs shell completions via `agent-slack completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.39.0", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack --help")
    assert_match "#compdef agent-slack", shell_output("#{bin}/agent-slack completion zsh")
  end
end
