class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.18.1"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.18.1/agent-code-review-darwin-arm64.tar.gz"
      sha256 "ba92a4c27e57eb3b5593ef78bc2e604d768efba3ef118515a5ff96cbcc7c46a3"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.18.1/agent-code-review-darwin-amd64.tar.gz"
      sha256 "9267c16406be7c530c53d987d1bce07d8cef246fd64b55e82f7f658ce80de821"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.18.1/agent-code-review-linux-arm64.tar.gz"
      sha256 "4c866c7340386157e74c9c04da1cffe24a049158e62270e49c5f0984b1ae87db"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.18.1/agent-code-review-linux-amd64.tar.gz"
      sha256 "374cfe4a633f8468fd8b1b58a0303715fee2fb1455115dbc771d2e40084e2f01"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.18.1", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
