class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.41.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.41.0/agent-code-review-darwin-arm64.tar.gz"
      sha256 "180a45c8dbbffd643d2b18072ee273ed4d034b81714749e7be0ae6d1617b02a3"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.41.0/agent-code-review-darwin-amd64.tar.gz"
      sha256 "6f588c3bdb7716fbf0bf1fe820d07266186ab0b8e6a33b1be34f17617a3034ae"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.41.0/agent-code-review-linux-arm64.tar.gz"
      sha256 "af22f940ae8794269eca4209f51c36abb3970c049b63dcdf22275024a9915f92"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.41.0/agent-code-review-linux-amd64.tar.gz"
      sha256 "1e5c002d8f9dc247fe9b939827d0af08b910ea4349061e6d33dafa40854671c5"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.41.0", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
