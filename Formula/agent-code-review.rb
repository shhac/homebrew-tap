class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.39.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.39.0/agent-code-review-darwin-arm64.tar.gz"
      sha256 "464293248d2f370e7ad8b37887fa3a3586bd638961b36ea029d19e0e112a08ab"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.39.0/agent-code-review-darwin-amd64.tar.gz"
      sha256 "90473146bc3a541aadd243a2eabe3a58f7aa15f860d5347b825cff998951e9de"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.39.0/agent-code-review-linux-arm64.tar.gz"
      sha256 "8115ec1791f9fc7634e2a7cc5a8585960a3b537cc6fc861d7ac579169d61dee8"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.39.0/agent-code-review-linux-amd64.tar.gz"
      sha256 "c077cfb73dfb777168502f2b6640c6fe71fd5047c3575a9a6a8601925bbd1b8c"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.39.0", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
