class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.8.1"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.8.1/agent-code-review-darwin-arm64.tar.gz"
      sha256 "c807c1600cc807ae933730c9f0d95c58a7b1a193ecb98345813c0b6dfa273eb3"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.8.1/agent-code-review-darwin-amd64.tar.gz"
      sha256 "65dd1c5cd2a6f722e3171a239c92b61e9cb608a0e2ee23cda46fdefb9ab2f491"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.8.1/agent-code-review-linux-arm64.tar.gz"
      sha256 "8e7c172eb6a12780fec32ddc51c58aebf51c9f0e35d5043fd395c39258ebbb0f"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.8.1/agent-code-review-linux-amd64.tar.gz"
      sha256 "91d02214a7c57b32bc870893978248e5e3ca3045ccc8e40ca1bbb47e1712107e"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.8.1", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
