class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.3.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.3.0/agent-code-review-darwin-arm64.tar.gz"
      sha256 "7eefe032ab77e971fb6e12b2fe40b3408230e1ac088ce23b794104113562d8c5"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.3.0/agent-code-review-darwin-amd64.tar.gz"
      sha256 "b4d2a73e27f62b098d3df64a3b923747b70e1ebf3c0d81e0b8998096ce9d2934"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.3.0/agent-code-review-linux-arm64.tar.gz"
      sha256 "e1a0ffc4bbd733c3810e354ef1944febafae76e7a3f18c48af774ec0c3f016bc"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.3.0/agent-code-review-linux-amd64.tar.gz"
      sha256 "b2311be4323b30d9fc179b3157f5aefe38a353ccc288f8cde205eafce62c9caf"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.3.0", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
