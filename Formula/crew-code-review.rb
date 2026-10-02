class CrewCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/crew-code-review"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.51.0/crew-code-review-darwin-arm64.tar.gz"
      sha256 "81ecdc369360aa38a9d7e4b094e04f6feb8714983d9cc7b70e758885142af3ed"
    end
    on_intel do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.51.0/crew-code-review-darwin-amd64.tar.gz"
      sha256 "7e5a3dc8aba74cd1e99472e9b66fa9e7d718c1933d54e4074220015ecaf08a19"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.51.0/crew-code-review-linux-arm64.tar.gz"
      sha256 "d4d54edfe67471671d99651d2f8fe8828924beaab061934280436b38034631dc"
    end
    on_intel do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.51.0/crew-code-review-linux-amd64.tar.gz"
      sha256 "7ca07dab38c12721d3b9a247f8bb14f501204ec7ec3e93b3adf646e3f8697480"
    end
  end

  def install
    bin.install "crew-code-review"
    # Installs shell completions via `crew-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-code-review", "completion")
  end

  test do
    assert_match "0.51.0", shell_output("#{bin}/crew-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/crew-code-review --help")
    assert_match "#compdef crew-code-review", shell_output("#{bin}/crew-code-review completion zsh")
  end
end
