class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.27.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.27.1/agent-slack-darwin-arm64.tar.gz"
      sha256 "8fddfc71bfed26f84562443ef50e3489f49761a54c4ec5ac138bc1c8660aad1a"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.27.1/agent-slack-darwin-amd64.tar.gz"
      sha256 "49860e974bdc6bb2353661144d49b91a890de9d2701eb38c291c4f5ed39f1c89"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.27.1/agent-slack-linux-arm64.tar.gz"
      sha256 "ad8c8bcc9c705434a9af350e7334b9051f128ff0c57308ab2e47bc4befa5a540"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.27.1/agent-slack-linux-amd64.tar.gz"
      sha256 "d732fcc3d40def908c6bba78605bcd4a08d5e5957be3a613ec5c02492284330e"
    end
  end

  def install
    bin.install "agent-slack"
    # Installs shell completions via `agent-slack completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.27.1", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack --help")
    assert_match "#compdef agent-slack", shell_output("#{bin}/agent-slack completion zsh")
  end
end
