class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.9.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.9.0/agent-code-review-darwin-arm64.tar.gz"
      sha256 "e24e9329949fb419103d08580517714cb9594671f26d327aefba09216593bcfd"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.9.0/agent-code-review-darwin-amd64.tar.gz"
      sha256 "1681c388fa394c4b6f26e2954b92786bf936b7f9e7c4f519761469783c3f1bf9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.9.0/agent-code-review-linux-arm64.tar.gz"
      sha256 "18e32734a27c9f1869c285b226bd65770fde576f039f2ccd1d135740be9e42b6"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.9.0/agent-code-review-linux-amd64.tar.gz"
      sha256 "66f581ebda9e2c0cc9745d16dce2eb8ca378cd79a9ff2a199fa4fa15a4d228ed"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.9.0", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
