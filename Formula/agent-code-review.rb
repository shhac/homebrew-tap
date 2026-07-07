class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.6.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.6.0/agent-code-review-darwin-arm64.tar.gz"
      sha256 "e62a26d07055c79a798517b138cbe14638c2148ce55fc19abcb6e9d6ec844c81"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.6.0/agent-code-review-darwin-amd64.tar.gz"
      sha256 "ddba80511c1b80c1c71eaaca73e1e8a2ce8c27b05009ed5fd33d6fe88b15355f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.6.0/agent-code-review-linux-arm64.tar.gz"
      sha256 "73e3b795e59d180969d61138d2a6719d99ec08fffba6a49e560c9938ea38c7ea"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.6.0/agent-code-review-linux-amd64.tar.gz"
      sha256 "efed7a8ae3c143fbac87b6b0b7b739b1abf27f4849f6af1abc695c1bee8c2fbc"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.6.0", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
