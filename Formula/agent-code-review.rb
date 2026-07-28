class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.24.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.24.0/agent-code-review-darwin-arm64.tar.gz"
      sha256 "117c714c9740d31da0b98620ae0e8b2095024a1c0fa80100cdd3f99f96027e17"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.24.0/agent-code-review-darwin-amd64.tar.gz"
      sha256 "397cc8b3aff710a18672267f0919b91f6422430b25cf5aaca61e1f4652bda908"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.24.0/agent-code-review-linux-arm64.tar.gz"
      sha256 "53c9dc48ecabdd2925c480118a88fbd749e0d491dd16322909c0a0999c29d18b"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.24.0/agent-code-review-linux-amd64.tar.gz"
      sha256 "bcd14e7a46ab52b4a4c276bdb746f522aba98e876e0ce2c65a9c65f041d372e6"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.24.0", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
