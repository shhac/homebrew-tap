class CrewCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/crew-code-review"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.52.0/crew-code-review-darwin-arm64.tar.gz"
      sha256 "2b2ba961a6c722a47fc7bb8cc123418bf6dbd9c2fdd0a5d03b23c159bca787b6"
    end
    on_intel do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.52.0/crew-code-review-darwin-amd64.tar.gz"
      sha256 "8cfbda2b61190d583264949a3debed1ebf40f73fec56343838c17afedea07b9c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.52.0/crew-code-review-linux-arm64.tar.gz"
      sha256 "acb3db44e6d975ae8317912d85057b2450fc6e238093a39482fc2a00d8438fdd"
    end
    on_intel do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.52.0/crew-code-review-linux-amd64.tar.gz"
      sha256 "63b0d8df2411a85b075c19510734b865f8cb9f40c5be28a331c948cf64a369f7"
    end
  end

  def install
    bin.install "crew-code-review"
    # Installs shell completions via `crew-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-code-review", "completion")
  end

  test do
    assert_match "0.52.0", shell_output("#{bin}/crew-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/crew-code-review --help")
    assert_match "#compdef crew-code-review", shell_output("#{bin}/crew-code-review completion zsh")
  end
end
