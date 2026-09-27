class CrewCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/crew-code-review"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.49.0/crew-code-review-darwin-arm64.tar.gz"
      sha256 "353ba57b0a0ce627829b24a41245a10f952613210a6fbd813fc1bdc23b2aef63"
    end
    on_intel do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.49.0/crew-code-review-darwin-amd64.tar.gz"
      sha256 "404410011de259961212d11249baa0d8cc622666692013847146b591c004e629"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.49.0/crew-code-review-linux-arm64.tar.gz"
      sha256 "567d5bb2767a77d67e553a1668354fcd840db095d1ffecebf8c3a2bb32bd53aa"
    end
    on_intel do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.49.0/crew-code-review-linux-amd64.tar.gz"
      sha256 "6a931f6b07fa29c29001368eb4f75fdc56be237fd03edeac0b1557a34792497e"
    end
  end

  def install
    bin.install "crew-code-review"
    # Installs shell completions via `crew-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-code-review", "completion")
  end

  test do
    assert_match "0.49.0", shell_output("#{bin}/crew-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/crew-code-review --help")
    assert_match "#compdef crew-code-review", shell_output("#{bin}/crew-code-review completion zsh")
  end
end
