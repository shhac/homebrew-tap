class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.23.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.23.0/agent-code-review-darwin-arm64.tar.gz"
      sha256 "1fcc09cc40c03c6d4ef29cb6582b9b172968f19d3b4829aab05a5dd57e00bf55"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.23.0/agent-code-review-darwin-amd64.tar.gz"
      sha256 "2838b3b63d746fedb2552909e8fd11e4a3ce6a909406df3ab8603168ff23a91e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.23.0/agent-code-review-linux-arm64.tar.gz"
      sha256 "bd8a8a0d30a09214de0f9be5278f8ca236afe42e76fbca5c56b6debe2be9aa3b"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.23.0/agent-code-review-linux-amd64.tar.gz"
      sha256 "81355441c7407fbba4a71ed8688251934cac7b1b4ec0c50f83f4bb6a3ac3c2ef"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.23.0", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
