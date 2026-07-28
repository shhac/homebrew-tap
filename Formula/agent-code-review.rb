class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.22.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.22.0/agent-code-review-darwin-arm64.tar.gz"
      sha256 "2baf5fca80a3c0587ff29e667164b2d7f477bf7ce0a11f820cf1b80bf02826bd"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.22.0/agent-code-review-darwin-amd64.tar.gz"
      sha256 "57d2fa831ab047adcffda425c2534516adf8f1f1278c0cfb01886084ec4b383a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.22.0/agent-code-review-linux-arm64.tar.gz"
      sha256 "429640504c3c40c826eec48f6f3c70078195b55780e5b8b9d6540a9832fc886f"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.22.0/agent-code-review-linux-amd64.tar.gz"
      sha256 "0cb777c5fbff03709b170103b0a4ac2d22c166ecc55d0c5180205d11ae331c0d"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.22.0", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
