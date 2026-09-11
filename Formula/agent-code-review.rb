class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.35.1"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.35.1/agent-code-review-darwin-arm64.tar.gz"
      sha256 "e9ee5cf502dd42f366f47b99d5639f62a8446d75a7eb097d11ed2ee0336a29b3"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.35.1/agent-code-review-darwin-amd64.tar.gz"
      sha256 "79671634a2b1faa4b395d48a5e51166454c33edc874192b0ddbdd924f46c3090"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.35.1/agent-code-review-linux-arm64.tar.gz"
      sha256 "5e9a8998b933b33f79deac2ed75b6d74039b51c2bcf5f8fd4433dbcc16d58d18"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.35.1/agent-code-review-linux-amd64.tar.gz"
      sha256 "6341749c24fb58c75bce202091176e32f7dfada3afebfc582a42f8f962c35a8f"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.35.1", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
