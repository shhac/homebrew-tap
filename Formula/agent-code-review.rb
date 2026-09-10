class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.34.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.34.0/agent-code-review-darwin-arm64.tar.gz"
      sha256 "97289bff77a1354bbd5de2432ea80fcfc073556e3cd6bc54aec5f20b36dc358f"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.34.0/agent-code-review-darwin-amd64.tar.gz"
      sha256 "b9e54b858abe6c62267be7885f2c2a14cfb84a8a4fcb8991ff0f16c2dbe8bb79"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.34.0/agent-code-review-linux-arm64.tar.gz"
      sha256 "d7e188126c716aa5cb2a77338b6689ae1340af933f4afc346eecf3636ba1ef75"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.34.0/agent-code-review-linux-amd64.tar.gz"
      sha256 "ef3af563c16c31c333fd7261fa8891003bc9ca41c43bb228e6f5cc4bcaad7b43"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.34.0", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
