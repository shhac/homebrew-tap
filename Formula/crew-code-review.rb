class CrewCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/crew-code-review"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.49.2/crew-code-review-darwin-arm64.tar.gz"
      sha256 "ac79746087c60d8053a24599577ab43505fbe677546ae1196fcac4ed6807eefa"
    end
    on_intel do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.49.2/crew-code-review-darwin-amd64.tar.gz"
      sha256 "11819f2b6b815d010e7814e21b06f58f7294308c45ef011ba905c922d40c00af"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.49.2/crew-code-review-linux-arm64.tar.gz"
      sha256 "4d6d8aed095e8b72b2dd819cc681c72fde9b6313af5f94d18ac5cf79317b392e"
    end
    on_intel do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.49.2/crew-code-review-linux-amd64.tar.gz"
      sha256 "17193610f86fd6912de1cde7a737d3ee9d9ab0797a845e9385cbb149717a0652"
    end
  end

  def install
    bin.install "crew-code-review"
    # Installs shell completions via `crew-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-code-review", "completion")
  end

  test do
    assert_match "0.49.2", shell_output("#{bin}/crew-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/crew-code-review --help")
    assert_match "#compdef crew-code-review", shell_output("#{bin}/crew-code-review completion zsh")
  end
end
