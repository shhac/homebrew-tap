class AgentPostmark < Formula
  desc "Postmark delivery triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-postmark"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.8.0/agent-postmark-darwin-arm64.tar.gz"
      sha256 "f1e1866d3f645aee7fd5c7b7f94eb27d02bc516ee1b120f26c1dbc8489823d7f"
    end
    on_intel do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.8.0/agent-postmark-darwin-amd64.tar.gz"
      sha256 "fd44fb1a469602939a4dfac5f031ed0d4ff88509dad1e68f72f0661e668e0bcb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.8.0/agent-postmark-linux-arm64.tar.gz"
      sha256 "e4706b48e852720d036b4e2ef0b527ae13cfe723f6fa87e216ad7ffd04cf14ad"
    end
    on_intel do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.8.0/agent-postmark-linux-amd64.tar.gz"
      sha256 "b82ee57fedbe76afbfbc48e1694f8e5523df84e088ccb03ad4930a1ecf5c64d4"
    end
  end

  def install
    bin.install "agent-postmark"
    # Installs shell completions via `agent-postmark completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-postmark", "completion")
  end

  test do
    assert_match "0.8.0", shell_output("#{bin}/agent-postmark --version")
    assert_match "Postmark delivery triage CLI", shell_output("#{bin}/agent-postmark --help")
    assert_match "#compdef agent-postmark", shell_output("#{bin}/agent-postmark completion zsh")
  end
end
