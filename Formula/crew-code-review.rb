class CrewCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/crew-code-review"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.59.0/crew-code-review-darwin-arm64.tar.gz"
      sha256 "928cb7402f04975d8b7d0fb906273b7c34901d22713dd67c3a9071deb7a44e9f"
    end
    on_intel do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.59.0/crew-code-review-darwin-amd64.tar.gz"
      sha256 "2f5c5f08d28f7ac0cd68c1765d7867c35ef44f96f5584dd6786dbb27838dde45"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.59.0/crew-code-review-linux-arm64.tar.gz"
      sha256 "a9e5994361f8ae7b1eaa25433d8c3334392e587849eb3144c685735c1b1288dc"
    end
    on_intel do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.59.0/crew-code-review-linux-amd64.tar.gz"
      sha256 "8b43bb87ad532f4d7dcdb48d1c07f92473fe974994bc31d1552de11d5cf789a5"
    end
  end

  def install
    bin.install "crew-code-review"
    # Installs shell completions via `crew-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-code-review", "completion")
  end

  test do
    assert_match "0.59.0", shell_output("#{bin}/crew-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/crew-code-review --help")
    assert_match "#compdef crew-code-review", shell_output("#{bin}/crew-code-review completion zsh")
  end
end
