class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.21.1"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.21.1/agent-code-review-darwin-arm64.tar.gz"
      sha256 "16d0e9a6617d2859f3bacf835b56ec063f3ae9c1c4a1d71c499aeb59cf8c478c"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.21.1/agent-code-review-darwin-amd64.tar.gz"
      sha256 "04cf79d5fd6dddaae5572c3ae291e0d4ab4a0f4acaea0a533059a7ae19e001c6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.21.1/agent-code-review-linux-arm64.tar.gz"
      sha256 "ac56135a27069086d0cc3f0283b684d672d5e127f3b303fb6b4ef16b03a66c73"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.21.1/agent-code-review-linux-amd64.tar.gz"
      sha256 "c59c54bb31600760bfcc160f38e7f17aad4a223c6be1b033f8db99321381c109"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.21.1", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
