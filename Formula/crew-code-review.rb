class CrewCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/crew-code-review"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.60.0/crew-code-review-darwin-arm64.tar.gz"
      sha256 "c5d303c4ec9e7ec0cf75423bffb43c36f877bd20be2d019118f351a40c60364e"
    end
    on_intel do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.60.0/crew-code-review-darwin-amd64.tar.gz"
      sha256 "34a81deb6fe2d4970c316a3e711d4d4ce2931f0583024a44320d0aac39f4d222"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.60.0/crew-code-review-linux-arm64.tar.gz"
      sha256 "ee448d00d449f95ba4589eea98c9dc4f9c2b1eb74f7fd92f0ea27b272ab59440"
    end
    on_intel do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.60.0/crew-code-review-linux-amd64.tar.gz"
      sha256 "03cdf14bb22e5271311f74f4355935e671e035996f1814c0f1c9c4ce180fb551"
    end
  end

  def install
    bin.install "crew-code-review"
    # Installs shell completions via `crew-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-code-review", "completion")
  end

  test do
    assert_match "0.60.0", shell_output("#{bin}/crew-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/crew-code-review --help")
    assert_match "#compdef crew-code-review", shell_output("#{bin}/crew-code-review completion zsh")
  end
end
