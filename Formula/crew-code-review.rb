class CrewCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/crew-code-review"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.61.0/crew-code-review-darwin-arm64.tar.gz"
      sha256 "f5fd455a86dbb9c26949ac185b74357a07e1da11c460756f68beb9219119777f"
    end
    on_intel do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.61.0/crew-code-review-darwin-amd64.tar.gz"
      sha256 "20b19a21ed6652a0353b18e69f188d31b31e35a831af7a46cf9a44aba8d5b0d2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.61.0/crew-code-review-linux-arm64.tar.gz"
      sha256 "18cc25fc020f116880254d5078665e866c2a5483d0384e19c3239fc8b60df838"
    end
    on_intel do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.61.0/crew-code-review-linux-amd64.tar.gz"
      sha256 "9a75fa0ea2573a7f8be348499c00570568070bacafe1d6900ca950595e2cebe1"
    end
  end

  def install
    bin.install "crew-code-review"
    # Installs shell completions via `crew-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-code-review", "completion")
  end

  test do
    assert_match "0.61.0", shell_output("#{bin}/crew-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/crew-code-review --help")
    assert_match "#compdef crew-code-review", shell_output("#{bin}/crew-code-review completion zsh")
  end
end
