class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.46.0/agent-code-review-darwin-arm64.tar.gz"
      sha256 "e39f09b9906804197525a69fdd3f76d405bc028f7a645a012b6738c0870da930"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.46.0/agent-code-review-darwin-amd64.tar.gz"
      sha256 "7d1b77f60e4e33f520d9b93e959b7a159591559202e67543dc317ef95da0b9bf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.46.0/agent-code-review-linux-arm64.tar.gz"
      sha256 "e4c7855820d4c9f55a8c6b3f064eca50ba4154f7b908c66db653522affdc256f"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.46.0/agent-code-review-linux-amd64.tar.gz"
      sha256 "2c7f6db4a1930baf2c4662f7eeb279db9c19075f11796020613689215fdaed57"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.46.0", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
