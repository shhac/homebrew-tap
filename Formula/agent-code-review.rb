class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.22.1"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.22.1/agent-code-review-darwin-arm64.tar.gz"
      sha256 "dfc9498ce97fc9c5d0fd1e44ba5c4b326af82a1a3ce8b163c592c1c26647e83d"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.22.1/agent-code-review-darwin-amd64.tar.gz"
      sha256 "0857d6d38abeaf42af57e9b36bd493bdc3095c916fc78834eb6bd5a9ffb0ae0f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.22.1/agent-code-review-linux-arm64.tar.gz"
      sha256 "b428193380684fbf30286a7b740f1af39209ff667421e02dc9eb31fe8559e5ce"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.22.1/agent-code-review-linux-amd64.tar.gz"
      sha256 "4408f5740575bd0f19796abaeba9365f87c99336589beeedda2e0f7be3692424"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.22.1", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
