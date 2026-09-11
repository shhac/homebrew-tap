class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.35.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.35.0/agent-code-review-darwin-arm64.tar.gz"
      sha256 "15818163011bd4449a4a2707475a09372fc93bea5be1d2f08d19d6842ca99f29"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.35.0/agent-code-review-darwin-amd64.tar.gz"
      sha256 "f18e75e72222ac9267acccfe16a84e2e6d0bc45418f636fdbf7878bd2ac6206f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.35.0/agent-code-review-linux-arm64.tar.gz"
      sha256 "7b3b100221c3434ccf4fed23512698f6b7c0ea1f3d02bbf72c8933e2c7be659c"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.35.0/agent-code-review-linux-amd64.tar.gz"
      sha256 "4e668e7fa96e875aa7080075024d480a4d52f6427ef2fdea5462ce1b1af1c08b"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.35.0", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
