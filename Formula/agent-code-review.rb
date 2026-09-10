class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.34.2"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.34.2/agent-code-review-darwin-arm64.tar.gz"
      sha256 "f4332e6c64200b1316e86b08fb5459345225b56b765f0ac224cb6fd7c5187553"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.34.2/agent-code-review-darwin-amd64.tar.gz"
      sha256 "e84c7cd83eb6f0556eb6191619936cdb495468b6c1b21e4002f6442b4eceeaff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.34.2/agent-code-review-linux-arm64.tar.gz"
      sha256 "d045cec2180a0654cff955b48f97b34dd40e27cc19ff2ac5c3f384ea0a4caf6d"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.34.2/agent-code-review-linux-amd64.tar.gz"
      sha256 "8761ef16f72e8838d0754bdd90b89390d1849207cfb226c89067a7783b4d129c"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.34.2", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
