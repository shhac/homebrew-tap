class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.32.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.32.0/agent-code-review-darwin-arm64.tar.gz"
      sha256 "07c1eb48b915419c395a83539ac6205e95bf6fe291175eb0c5dbced594436b0d"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.32.0/agent-code-review-darwin-amd64.tar.gz"
      sha256 "611f1ce60c8fe8315c0850fcfd748707ef3404874a68290f29d54a867312aa7e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.32.0/agent-code-review-linux-arm64.tar.gz"
      sha256 "424943d9c99afa684d50256834bcd34bc5ea22900a8fccc6ee53fe2e9d0474f4"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.32.0/agent-code-review-linux-amd64.tar.gz"
      sha256 "f3762e49c9a9d889d4a81f037d7456fd0b7a31f7df9179cc42da64e0797de3e2"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.32.0", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
