class AgentIncident < Formula
  desc "incident.io triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-incident"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-incident/releases/download/v0.6.0/agent-incident-darwin-arm64.tar.gz"
      sha256 "37465b74dbc8ad46d2d0263d9b2e69ece72cdcafe1e29a87b3fe9d46519e482d"
    end
    on_intel do
      url "https://github.com/shhac/agent-incident/releases/download/v0.6.0/agent-incident-darwin-amd64.tar.gz"
      sha256 "92f8e4707f8b385faf280585cb60aab8b6636368038bfcb6fae61a5d353f1f95"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-incident/releases/download/v0.6.0/agent-incident-linux-arm64.tar.gz"
      sha256 "add9d7cc952ce849d1aff2cd5fba7b0db210b96ac78a476563d0f6f88b1ba872"
    end
    on_intel do
      url "https://github.com/shhac/agent-incident/releases/download/v0.6.0/agent-incident-linux-amd64.tar.gz"
      sha256 "6ae14e95e7caa13113461d2ccc46200597c468240bdcaef7af6ff29c63cd4eb6"
    end
  end

  def install
    bin.install Dir["agent-incident-*"].first => "agent-incident"
    # Installs shell completions via `agent-incident completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-incident", "completion")
  end

  test do
    assert_match "0.6.0", shell_output("#{bin}/agent-incident --version")
    assert_match "incident", shell_output("#{bin}/agent-incident --help")
  end
end
