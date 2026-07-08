class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.12.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.12.0/agent-code-review-darwin-arm64.tar.gz"
      sha256 "55c2312054c92d9dfb8a9352e05345224ba41ca4f46824e83a62da09655a5d34"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.12.0/agent-code-review-darwin-amd64.tar.gz"
      sha256 "afdcae794fa476b18bd463cb5b45e6757512934fd4ddf98076988d038b51d418"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.12.0/agent-code-review-linux-arm64.tar.gz"
      sha256 "92a66fbb86b53aba2b480d69c99f1b466ec1715b85ca797d6b2a96d68b969ea9"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.12.0/agent-code-review-linux-amd64.tar.gz"
      sha256 "21477b66e62d67765056ffbed75ea75e99de2190794bafb7250b6ac8d975f8ff"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.12.0", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
