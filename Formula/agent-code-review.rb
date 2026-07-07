class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.2.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.2.0/agent-code-review-darwin-arm64.tar.gz"
      sha256 "a44f96e61226ac46a5010a42ecc650ca21aad5f86d9534548880bc8179df0a57"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.2.0/agent-code-review-darwin-amd64.tar.gz"
      sha256 "96801aabce82a69b23736af0491cfade8f31460bcef8a6fcf32e2d81875a6bbe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.2.0/agent-code-review-linux-arm64.tar.gz"
      sha256 "cf351544b7467927a4c3d9252edbe26ce8f187a39d76f3477a6288f100ecafd7"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.2.0/agent-code-review-linux-amd64.tar.gz"
      sha256 "756f267281f08898600c602e4fc6b9bb239c64be3874ea5f673f569c72d17522"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.2.0", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
