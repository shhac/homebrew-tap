class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.45.0/agent-code-review-darwin-arm64.tar.gz"
      sha256 "9bb6298b29e5d8dfd8512fca8b2167546a5981904a35f0eafbfcebc6819f0e04"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.45.0/agent-code-review-darwin-amd64.tar.gz"
      sha256 "816bd2a7ca810cce6bd0a57ff95ffd0a6614f85ae794d7f7a033b4bf9f1a626d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.45.0/agent-code-review-linux-arm64.tar.gz"
      sha256 "ae9d9f8b7045170c128e2e6f943a941883c2692aa38dd39b2f79088a97d2f6ef"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.45.0/agent-code-review-linux-amd64.tar.gz"
      sha256 "1e9cb15cb369e77c13bf1dc9193c65bc1acacfc5dc377f148c2043e3eb4b921d"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.45.0", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
