class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.8.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.8.0/agent-code-review-darwin-arm64.tar.gz"
      sha256 "f5972257636fb57eb4bc48b4358faf5af1c52dc442d6e59e34f46f1a61288ae4"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.8.0/agent-code-review-darwin-amd64.tar.gz"
      sha256 "8a6212a032bb2601aa8a4b2dab1e47d52cd0da7020104978e2e8c1744e7ab986"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.8.0/agent-code-review-linux-arm64.tar.gz"
      sha256 "206701506e42fc24d7a5b90e784ac8e067529f27e8e98f096cb5b6910bb71eb6"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.8.0/agent-code-review-linux-amd64.tar.gz"
      sha256 "4a3cde63b47239b6dd8a164c3f2635e16ddda87724c0453a433f643fe35ede88"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.8.0", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
