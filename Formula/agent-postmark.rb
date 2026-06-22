class AgentPostmark < Formula
  desc "Postmark delivery triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-postmark"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.9.0/agent-postmark-darwin-arm64.tar.gz"
      sha256 "6d85fb774222f3e1c4a7b77696980fa139aa9d5573854c929d2989a52043964e"
    end
    on_intel do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.9.0/agent-postmark-darwin-amd64.tar.gz"
      sha256 "035e476895cb9b7d88125881192865208b6eb0e103f410cf0e09d56ca5af0691"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.9.0/agent-postmark-linux-arm64.tar.gz"
      sha256 "325d53898f3c499872b5c7c5a2b5c5b9a8f78eea9975b3d835f547c7f49cc9a0"
    end
    on_intel do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.9.0/agent-postmark-linux-amd64.tar.gz"
      sha256 "3b07aaccd2bee91ba9998fbcb75589c615c9008a862d7f2f32bc3959bc55e619"
    end
  end

  def install
    bin.install "agent-postmark"
    # Installs shell completions via `agent-postmark completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-postmark", "completion")
  end

  test do
    assert_match "0.9.0", shell_output("#{bin}/agent-postmark --version")
    assert_match "Postmark delivery triage CLI", shell_output("#{bin}/agent-postmark --help")
    assert_match "#compdef agent-postmark", shell_output("#{bin}/agent-postmark completion zsh")
  end
end
