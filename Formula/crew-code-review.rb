class CrewCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/crew-code-review"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.56.0/crew-code-review-darwin-arm64.tar.gz"
      sha256 "64c9d136af2dcadcefd7a2fb55649761d02fe4a154c11e2546d33b6516322fc8"
    end
    on_intel do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.56.0/crew-code-review-darwin-amd64.tar.gz"
      sha256 "c0003ca01f9e7bee7ea7e859e84edfa41171d5bf7cc3de6d080872232641843a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.56.0/crew-code-review-linux-arm64.tar.gz"
      sha256 "c6b48e2525910b2aee16c44d145063b4d076a5d31f64624f1995fadf1a5fc545"
    end
    on_intel do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.56.0/crew-code-review-linux-amd64.tar.gz"
      sha256 "c5d6a3333ae5d4d0ebc87cb64f648bbe0c03eaeefc4997922115240bc4677ec2"
    end
  end

  def install
    bin.install "crew-code-review"
    # Installs shell completions via `crew-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-code-review", "completion")
  end

  test do
    assert_match "0.56.0", shell_output("#{bin}/crew-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/crew-code-review --help")
    assert_match "#compdef crew-code-review", shell_output("#{bin}/crew-code-review completion zsh")
  end
end
