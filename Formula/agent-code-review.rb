class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.42.0/agent-code-review-darwin-arm64.tar.gz"
      sha256 "44a6cd72b2d800aea5c8ae27a8ecbe911593fd3402c89dfdbefe79239cf9adc7"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.42.0/agent-code-review-darwin-amd64.tar.gz"
      sha256 "528379e1ed4875a77be85f0a93d14693380c52cbc365fae0f28a8d9c29bd4da7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.42.0/agent-code-review-linux-arm64.tar.gz"
      sha256 "1d6b7162399e66d90912795e3a87a50a80f365e2a6de04b438a1e97ebc57a482"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.42.0/agent-code-review-linux-amd64.tar.gz"
      sha256 "df82162f9c8b44a19a5f2e353b50a8a94dcd6f7b0bd9c83dc4e196a667be496d"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.42.0", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
