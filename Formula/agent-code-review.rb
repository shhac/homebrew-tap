class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.25.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.25.0/agent-code-review-darwin-arm64.tar.gz"
      sha256 "a2a53829e4a5368677941635b98edd3862b6a7238a40ba467ee8d86bb20c334e"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.25.0/agent-code-review-darwin-amd64.tar.gz"
      sha256 "dfc996ca009d17e0a118461a80dbf24ef574d5927cc0f222fc0250872d6c6ce3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.25.0/agent-code-review-linux-arm64.tar.gz"
      sha256 "f79bafcea82a89b97ac917dfcdb67f07c12538572f7e5e297679c2e62599fd44"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.25.0/agent-code-review-linux-amd64.tar.gz"
      sha256 "df4b34e11e4e4c0c809d94c6955a287d2bac69649b4f409aceba55e7a46458a4"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.25.0", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
