class CrewCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/crew-code-review"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.48.0/crew-code-review-darwin-arm64.tar.gz"
      sha256 "b6bdc69eb1a948ee1c091f46e1775841b44910f43f2a2d1d01881c9517aabe5d"
    end
    on_intel do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.48.0/crew-code-review-darwin-amd64.tar.gz"
      sha256 "33ac17af2ccb83674b47eafd95deda035394c74b3f2b0d85db369c9498934e58"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.48.0/crew-code-review-linux-arm64.tar.gz"
      sha256 "2cf0bfa07062701d64e8053ba71e784a48e415189a41ebee1c1aa3aaf45e2aa4"
    end
    on_intel do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.48.0/crew-code-review-linux-amd64.tar.gz"
      sha256 "97dc5cfe549b0282e40ca2bac8eee0bccfb292b600e8b52a17fb88adfb73eec2"
    end
  end

  def install
    bin.install "crew-code-review"
    # Installs shell completions via `crew-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-code-review", "completion")
  end

  test do
    assert_match "0.48.0", shell_output("#{bin}/crew-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/crew-code-review --help")
    assert_match "#compdef crew-code-review", shell_output("#{bin}/crew-code-review completion zsh")
  end
end
