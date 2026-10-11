class CrewCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/crew-code-review"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.57.0/crew-code-review-darwin-arm64.tar.gz"
      sha256 "dd349deadb8ed7d06d7ad735b21a9f332f848dd10d4f6cff959f92814316720a"
    end
    on_intel do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.57.0/crew-code-review-darwin-amd64.tar.gz"
      sha256 "a95a33be97a15d9111ec77a1056f379d5f1462de3a5abcaf63f0fe9c1f4dcf90"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.57.0/crew-code-review-linux-arm64.tar.gz"
      sha256 "615d96070002b0cbddce35fdf82a0de8b59f8db28698ca1c1bdbd47a13c9794e"
    end
    on_intel do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.57.0/crew-code-review-linux-amd64.tar.gz"
      sha256 "3c12154c442280c4226337cc09bef65548ea6b21e38bff22eec663c2c31ec4bf"
    end
  end

  def install
    bin.install "crew-code-review"
    # Installs shell completions via `crew-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-code-review", "completion")
  end

  test do
    assert_match "0.57.0", shell_output("#{bin}/crew-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/crew-code-review --help")
    assert_match "#compdef crew-code-review", shell_output("#{bin}/crew-code-review completion zsh")
  end
end
