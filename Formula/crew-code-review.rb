class CrewCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/crew-code-review"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.50.0/crew-code-review-darwin-arm64.tar.gz"
      sha256 "ac84bb408b6aaa63b79176d4b35f1e049db896fe91a24574bd6d8670424fb61f"
    end
    on_intel do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.50.0/crew-code-review-darwin-amd64.tar.gz"
      sha256 "b9de21087367cf47a97e3d018a78f371c7369c89e867ab2dafb3fb4deb294c56"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.50.0/crew-code-review-linux-arm64.tar.gz"
      sha256 "80a152098e06d38877899cdbc58453a3541f675b334fe10b8cf59d6f4c3ef2f1"
    end
    on_intel do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.50.0/crew-code-review-linux-amd64.tar.gz"
      sha256 "fe8fb4db115fe1db68bdfc720fdb9efbff4c96d5a45595eecfac788cc1bcf4c6"
    end
  end

  def install
    bin.install "crew-code-review"
    # Installs shell completions via `crew-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-code-review", "completion")
  end

  test do
    assert_match "0.50.0", shell_output("#{bin}/crew-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/crew-code-review --help")
    assert_match "#compdef crew-code-review", shell_output("#{bin}/crew-code-review completion zsh")
  end
end
