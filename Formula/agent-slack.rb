class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.43.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.43.0/agent-slack-darwin-arm64.tar.gz"
      sha256 "a421c4cd13d42b2b91e7f7ca330b9f979d8e385aaee7c5c546088998f6d57751"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.43.0/agent-slack-darwin-amd64.tar.gz"
      sha256 "c33b618cd4eaadec1a5c4f17a669425d241e62b6c6b1e567fd11dc970c6aeb05"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.43.0/agent-slack-linux-arm64.tar.gz"
      sha256 "5bf87ac288f6ca23911829c581137489bfe7ee03fcb4dadd2f37a95ec31ec18e"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.43.0/agent-slack-linux-amd64.tar.gz"
      sha256 "85bdd2c1c7d46767fa9b8e649887f8c6f9a8dd3d2fa0c7efc215d62074e3b4d1"
    end
  end

  def install
    bin.install "agent-slack"
    # Installs shell completions via `agent-slack completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.43.0", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack --help")
    assert_match "#compdef agent-slack", shell_output("#{bin}/agent-slack completion zsh")
  end
end
