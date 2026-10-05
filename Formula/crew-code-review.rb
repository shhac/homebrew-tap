class CrewCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/crew-code-review"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.54.0/crew-code-review-darwin-arm64.tar.gz"
      sha256 "18ffaf39fc1598ab31bc3aeeb917db953b186b02d95a18a8b78571c91c8ccbc0"
    end
    on_intel do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.54.0/crew-code-review-darwin-amd64.tar.gz"
      sha256 "942e5b10756f5c9e8d03eefbe28766744143c344f1447f06dcfe2fe83baed9f5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.54.0/crew-code-review-linux-arm64.tar.gz"
      sha256 "8c3488f0ce122981efef51629579fb8ee081785f1e18dde615589c8ddb8d3abb"
    end
    on_intel do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.54.0/crew-code-review-linux-amd64.tar.gz"
      sha256 "c7097cf57ef39bd8bbd5c6d9848c9b2d8ad9f7135894273272dc0b2d535b2f83"
    end
  end

  def install
    bin.install "crew-code-review"
    # Installs shell completions via `crew-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-code-review", "completion")
  end

  test do
    assert_match "0.54.0", shell_output("#{bin}/crew-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/crew-code-review --help")
    assert_match "#compdef crew-code-review", shell_output("#{bin}/crew-code-review completion zsh")
  end
end
