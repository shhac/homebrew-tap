class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.38.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.38.0/agent-code-review-darwin-arm64.tar.gz"
      sha256 "51a04ce4fc56b48405aeab2b75e27ee4f4acefb80233d8444779b0661ae425db"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.38.0/agent-code-review-darwin-amd64.tar.gz"
      sha256 "120144271c463a82c2c0bc39c79fbaf018d88c64c22022a7ba3f0027e562eec4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.38.0/agent-code-review-linux-arm64.tar.gz"
      sha256 "a581ec1e8578c48d5eaa94cf8558a0d6103fe6cc011341711c74f0d339163714"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.38.0/agent-code-review-linux-amd64.tar.gz"
      sha256 "ecb1168671df32658806de19214dc1cef9971714fe45e8b6589e5720d7809e0f"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.38.0", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
