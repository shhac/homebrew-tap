class AgentPostmark < Formula
  desc "Postmark delivery triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-postmark"
  version "0.13.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.13.0/agent-postmark-darwin-arm64.tar.gz"
      sha256 "f5a86d609102a26b66e2b6c3a67f870fb1e47ff51b3f2d3d3c3c4dd32c531482"
    end
    on_intel do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.13.0/agent-postmark-darwin-amd64.tar.gz"
      sha256 "4b845f1bbd42820cc5d19d4a763e5ab347149ebe08a420a6e607f932cc13c890"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.13.0/agent-postmark-linux-arm64.tar.gz"
      sha256 "052f94f6b9b02aac5f39ec88c6b1d3f8012603c672c5a63fec6690fa0e5496c7"
    end
    on_intel do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.13.0/agent-postmark-linux-amd64.tar.gz"
      sha256 "c90fae5216436926c74e19310ff4b3ba9ec5583c4625a7dffc1142da0cfc418b"
    end
  end

  def install
    bin.install "agent-postmark"
    # Installs shell completions via `agent-postmark completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-postmark", "completion")
  end

  test do
    assert_match "0.13.0", shell_output("#{bin}/agent-postmark --version")
    assert_match "Postmark delivery triage CLI", shell_output("#{bin}/agent-postmark --help")
    assert_match "#compdef agent-postmark", shell_output("#{bin}/agent-postmark completion zsh")
  end
end
