class CrewCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/crew-code-review"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.49.3/crew-code-review-darwin-arm64.tar.gz"
      sha256 "b372c1b8a2c636e5f0e0d510f53ba0c032a531b5f18a87b085e2227ee137922d"
    end
    on_intel do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.49.3/crew-code-review-darwin-amd64.tar.gz"
      sha256 "53c1e50a95261b3b7e7fc4d623de321e5eecc88add501c8f9307730bb82ededb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.49.3/crew-code-review-linux-arm64.tar.gz"
      sha256 "f41df4252123cf678dcdbc3e00537d4438082bd0cef3150c3fd9b46e5496c50b"
    end
    on_intel do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.49.3/crew-code-review-linux-amd64.tar.gz"
      sha256 "63f5478da4ae27435b988f2993b262be5da94d44f36449251b405cbc8df657d6"
    end
  end

  def install
    bin.install "crew-code-review"
    # Installs shell completions via `crew-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-code-review", "completion")
  end

  test do
    assert_match "0.49.3", shell_output("#{bin}/crew-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/crew-code-review --help")
    assert_match "#compdef crew-code-review", shell_output("#{bin}/crew-code-review completion zsh")
  end
end
