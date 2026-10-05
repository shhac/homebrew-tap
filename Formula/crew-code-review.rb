class CrewCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/crew-code-review"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.55.0/crew-code-review-darwin-arm64.tar.gz"
      sha256 "4e3a0243b3c6e5ed9734c750769b1fb2261995d9b34a56ea26fb4dce4e24d0d3"
    end
    on_intel do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.55.0/crew-code-review-darwin-amd64.tar.gz"
      sha256 "f6865cba4d28eaf05e895bf6221459005c0adbb5805de2de26dd054367037ecf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.55.0/crew-code-review-linux-arm64.tar.gz"
      sha256 "bb4773c1ab14fd7c97805a29232e66e6fe58d1af63b3edf00100694f9b9fbfe9"
    end
    on_intel do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.55.0/crew-code-review-linux-amd64.tar.gz"
      sha256 "3f589cd7106a0371cdaa409023d8c15488100f12da9a450ae07b92db27d1a416"
    end
  end

  def install
    bin.install "crew-code-review"
    # Installs shell completions via `crew-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-code-review", "completion")
  end

  test do
    assert_match "0.55.0", shell_output("#{bin}/crew-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/crew-code-review --help")
    assert_match "#compdef crew-code-review", shell_output("#{bin}/crew-code-review completion zsh")
  end
end
