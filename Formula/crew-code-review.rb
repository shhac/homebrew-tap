class CrewCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/crew-code-review"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.58.0/crew-code-review-darwin-arm64.tar.gz"
      sha256 "188b638e2e72d2e7bcf9f6dd7238ca2d32e365cbd3aa573a22db5d18b0fe1b74"
    end
    on_intel do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.58.0/crew-code-review-darwin-amd64.tar.gz"
      sha256 "7311fae5a5aa25a19abdfa0e77eaf72be12f80636f3b104987aa509e8dcca3c9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.58.0/crew-code-review-linux-arm64.tar.gz"
      sha256 "f3cdac54bc1fbdc2e3f3fab983ee76e878c1bea9e544dc2f2c8e447266bbb765"
    end
    on_intel do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.58.0/crew-code-review-linux-amd64.tar.gz"
      sha256 "720d9f0f47bb56d1b0d04cf0407c504eea94cb5ee9b1f490bd708369961d29a5"
    end
  end

  def install
    bin.install "crew-code-review"
    # Installs shell completions via `crew-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-code-review", "completion")
  end

  test do
    assert_match "0.58.0", shell_output("#{bin}/crew-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/crew-code-review --help")
    assert_match "#compdef crew-code-review", shell_output("#{bin}/crew-code-review completion zsh")
  end
end
