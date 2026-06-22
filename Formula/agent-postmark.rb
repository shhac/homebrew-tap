class AgentPostmark < Formula
  desc "Postmark delivery triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-postmark"
  version "0.11.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.11.1/agent-postmark-darwin-arm64.tar.gz"
      sha256 "33824476c6af5876348a264954f198a63066484fa02252d09a4b3c3c23c5f42b"
    end
    on_intel do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.11.1/agent-postmark-darwin-amd64.tar.gz"
      sha256 "824e5b2177d7a3199628d63535e5e3bd6c65eee5bc0cdd725b2e0e9ac44f0292"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.11.1/agent-postmark-linux-arm64.tar.gz"
      sha256 "77ce3bd04388e9f76fd40603fb8030aa38dfbb5cfa2b70078c684db67d4808ff"
    end
    on_intel do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.11.1/agent-postmark-linux-amd64.tar.gz"
      sha256 "9ce81d4095c4870cf15bc43a8a66008e84013e6a2b9cabbee16e4c4350fdf36b"
    end
  end

  def install
    bin.install "agent-postmark"
    # Installs shell completions via `agent-postmark completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-postmark", "completion")
  end

  test do
    assert_match "0.11.1", shell_output("#{bin}/agent-postmark --version")
    assert_match "Postmark delivery triage CLI", shell_output("#{bin}/agent-postmark --help")
    assert_match "#compdef agent-postmark", shell_output("#{bin}/agent-postmark completion zsh")
  end
end
