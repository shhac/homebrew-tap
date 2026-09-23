class CrewCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/crew-code-review"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.47.0/agent-code-review-darwin-arm64.tar.gz"
      sha256 "1c2ab86750ae55ec1d7f0434b7dde1a6bb5fe3665231728b84f6d2588366d210"
    end
    on_intel do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.47.0/agent-code-review-darwin-amd64.tar.gz"
      sha256 "41dff97988e6181fa72ca67c88903ca2272392987dc312711595e38caa6ce1e5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.47.0/agent-code-review-linux-arm64.tar.gz"
      sha256 "259efceb977ebf18f50eb1b165e55c4253a4a56e30adad022fcf8934eb7f5e0b"
    end
    on_intel do
      url "https://github.com/shhac/crew-code-review/releases/download/v0.47.0/agent-code-review-linux-amd64.tar.gz"
      sha256 "25b9155ae325d390a314d97da43cfb5fe585108a1833bd051c3d240de439acd6"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.47.0", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
