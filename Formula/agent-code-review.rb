class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.26.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.26.0/agent-code-review-darwin-arm64.tar.gz"
      sha256 "b6851c5b23c6f3e23852e611b0effc5592f5d4734912b103afb94aeb523525f0"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.26.0/agent-code-review-darwin-amd64.tar.gz"
      sha256 "cb0f8df0ae93d8c024be9a247a05295a5a3ab34aaddbd9fb053fd468ef134da8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.26.0/agent-code-review-linux-arm64.tar.gz"
      sha256 "f3c20609ee676cbd67e4e92fb06cc905c0ab5f3bca4ea99be885ad6bf7e34629"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.26.0/agent-code-review-linux-amd64.tar.gz"
      sha256 "cc8fb2532b47e342849d8a156dee806fd946d17257e1745bfa595e8a4499dfea"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.26.0", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
