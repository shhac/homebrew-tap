class CrewCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/crew-code-review"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.53.0/crew-code-review-darwin-arm64.tar.gz"
      sha256 "6870f08a8eab42ddb55eab6677780def6cc06876142de9377762882d1aaab243"
    end
    on_intel do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.53.0/crew-code-review-darwin-amd64.tar.gz"
      sha256 "1180e32603cafba9be7a534cda150d5fece391fb32e08981e6496dc5a4da228a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.53.0/crew-code-review-linux-arm64.tar.gz"
      sha256 "f71bf9bb6803adbb1660eacfddee8fb1b3cb721e2354a6d31f45fd9dac153f59"
    end
    on_intel do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.53.0/crew-code-review-linux-amd64.tar.gz"
      sha256 "76d5b4bbb73fd5915470935d618bf284f9dc8f8ff5878cefeb2739c5a7ef78ea"
    end
  end

  def install
    bin.install "crew-code-review"
    # Installs shell completions via `crew-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-code-review", "completion")
  end

  test do
    assert_match "0.53.0", shell_output("#{bin}/crew-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/crew-code-review --help")
    assert_match "#compdef crew-code-review", shell_output("#{bin}/crew-code-review completion zsh")
  end
end
