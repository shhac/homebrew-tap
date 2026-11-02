class CrewCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/crew-code-review"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.61.1/crew-code-review-darwin-arm64.tar.gz"
      sha256 "5b85abbdaf1d85dff809c4afcf779c0c6aaae4832c2ab90ff1973120998fba68"
    end
    on_intel do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.61.1/crew-code-review-darwin-amd64.tar.gz"
      sha256 "ceef2251561198ce1b7621b677a6acfa0557998a1090087b78373c108a702ede"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.61.1/crew-code-review-linux-arm64.tar.gz"
      sha256 "2fcd48f8b6778828278cf448803a4a7c02d2a2e0c3e6d00f2d964ecae42fc1b4"
    end
    on_intel do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.61.1/crew-code-review-linux-amd64.tar.gz"
      sha256 "735e1cb2d3ded2c959080b06d55d27b9c9a8c01d2e4f60627bcfd1d5ec301d39"
    end
  end

  def install
    bin.install "crew-code-review"
    # Installs shell completions via `crew-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-code-review", "completion")
  end

  test do
    assert_match "0.61.1", shell_output("#{bin}/crew-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/crew-code-review --help")
    assert_match "#compdef crew-code-review", shell_output("#{bin}/crew-code-review completion zsh")
  end
end
