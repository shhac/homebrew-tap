class CrewCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/crew-code-review"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.51.1/crew-code-review-darwin-arm64.tar.gz"
      sha256 "5749916e5a28904057773367297ae4f00cf800f0bd73d6b0013a72b61d30044a"
    end
    on_intel do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.51.1/crew-code-review-darwin-amd64.tar.gz"
      sha256 "f197c30c872f87b0c3134f0272188666adcfd56614dffb93aa4c098a2c16fb54"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.51.1/crew-code-review-linux-arm64.tar.gz"
      sha256 "b81e25165b9c602c4ca04f9ae89c7d9f40bdb64c69bba4bf5631ffb19cd2afa4"
    end
    on_intel do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.51.1/crew-code-review-linux-amd64.tar.gz"
      sha256 "e49b40475a766af62079b77b61f2d1c3b0761d8883e005043610bfd6b5e1bb93"
    end
  end

  def install
    bin.install "crew-code-review"
    # Installs shell completions via `crew-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-code-review", "completion")
  end

  test do
    assert_match "0.51.1", shell_output("#{bin}/crew-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/crew-code-review --help")
    assert_match "#compdef crew-code-review", shell_output("#{bin}/crew-code-review completion zsh")
  end
end
