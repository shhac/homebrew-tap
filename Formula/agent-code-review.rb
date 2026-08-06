class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.28.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.28.0/agent-code-review-darwin-arm64.tar.gz"
      sha256 "00cbff7754a7313e2e1c9ab4b4a109f0b37c9fb13261e0d731d50e7a9e841818"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.28.0/agent-code-review-darwin-amd64.tar.gz"
      sha256 "0dfcdf98f4aeb2bee6636ac832cb99ea398b8e8f5056ea092389385f62a14dcc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.28.0/agent-code-review-linux-arm64.tar.gz"
      sha256 "1ed99b012c28e275ef229d8d753bf5af3fa68490531ea9d1d64f75f70ef8379f"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.28.0/agent-code-review-linux-amd64.tar.gz"
      sha256 "60f6077590c47e0876ff39456a4ff86c59df42d5628ff3e4a2c5ed4e77cdf4a8"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.28.0", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
