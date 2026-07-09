class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.14.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.14.0/agent-code-review-darwin-arm64.tar.gz"
      sha256 "a2288acd39ef788f69f5beda509ed8b419348703d21aefdef92a350b051a0b0e"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.14.0/agent-code-review-darwin-amd64.tar.gz"
      sha256 "ec4aa10ede248f81d734b16c93291b644aa0985f589dd1b5c1446210b855074f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.14.0/agent-code-review-linux-arm64.tar.gz"
      sha256 "165bc3b58b3eefd1d5c9764c2cf2540a1013b0b9de354b72cad85c750c6fa7e2"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.14.0/agent-code-review-linux-amd64.tar.gz"
      sha256 "93a5849d2c5c5c24c9c62bdb3a7c9f38605a39cdcf9f11125a29c7c9ec6395f5"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.14.0", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
