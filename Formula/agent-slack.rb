class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.52.0/agent-slack-darwin-arm64.tar.gz"
      sha256 "7cfa89021fcc0b77312efb49463f6422db712344fa3d7b75c567c25598cb49b9"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.52.0/agent-slack-darwin-amd64.tar.gz"
      sha256 "c936014de45a45f9a364b132a4b5aacdc306511e51449e1bdd07f5e2fecbd902"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.52.0/agent-slack-linux-arm64.tar.gz"
      sha256 "1fd60a98a681a2df8e49cf3e64478aceae7b24df7a7495465a6b7107cf292101"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.52.0/agent-slack-linux-amd64.tar.gz"
      sha256 "b280c182e6b66d8545b8e75a5b9abb80afbe18f313f55f92b76cff31aec00549"
    end
  end

  def install
    bin.install "agent-slack"
    # Installs shell completions via `agent-slack completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.52.0", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack --help")
    assert_match "#compdef agent-slack", shell_output("#{bin}/agent-slack completion zsh")
  end
end
