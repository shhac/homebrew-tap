class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.19.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.19.0/agent-code-review-darwin-arm64.tar.gz"
      sha256 "1eb56101d96515a04998e4a10fc5c6228b0e3ee32b58ab1a4438ff4000646b31"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.19.0/agent-code-review-darwin-amd64.tar.gz"
      sha256 "2ee91d840d612df292b5b53c13972af379f05a507c918fedd0560ca12c752c4d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.19.0/agent-code-review-linux-arm64.tar.gz"
      sha256 "7182c6a4a98cc17e24787ed317a8c599c0a1b708024cf5e4c9144cc9e571f6ad"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.19.0/agent-code-review-linux-amd64.tar.gz"
      sha256 "4a26375a92027e8dde0c4127343b78f4e49b16d18d7d4a41267afd1293cd3ad6"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.19.0", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
