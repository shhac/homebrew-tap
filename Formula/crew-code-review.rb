class CrewCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/crew-code-review"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.49.1/crew-code-review-darwin-arm64.tar.gz"
      sha256 "86710c492e59792ba1429bcc496e32df3292829731c653c6353cab94431eebec"
    end
    on_intel do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.49.1/crew-code-review-darwin-amd64.tar.gz"
      sha256 "cbebd035c7fb18d8622f7e05a982f9e1d81859aa376265fa7628866e32a411aa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.49.1/crew-code-review-linux-arm64.tar.gz"
      sha256 "247021ce5bd7c137d4ad3a24a682186aba25223de9c8001fb8a1962b5fb1edf9"
    end
    on_intel do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.49.1/crew-code-review-linux-amd64.tar.gz"
      sha256 "620db1c3ae67a77143a453a4eaaa6e419d2cb4eaa1c5fae0ed5cdf09132c7757"
    end
  end

  def install
    bin.install "crew-code-review"
    # Installs shell completions via `crew-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-code-review", "completion")
  end

  test do
    assert_match "0.49.1", shell_output("#{bin}/crew-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/crew-code-review --help")
    assert_match "#compdef crew-code-review", shell_output("#{bin}/crew-code-review completion zsh")
  end
end
