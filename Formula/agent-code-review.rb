class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.19.1"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.19.1/agent-code-review-darwin-arm64.tar.gz"
      sha256 "4a0d66b0a0f11ba592772d1cc2e5623f8ede5f0c72433f37042d62d6b0c5ac2a"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.19.1/agent-code-review-darwin-amd64.tar.gz"
      sha256 "cf69569df4ea60d6cf40293bacdcb7eeb65804aec98f5298493e639916744cdb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.19.1/agent-code-review-linux-arm64.tar.gz"
      sha256 "012f196a2d8f84dd4b88fd932bb1065bf9f34d19b1b2eb7389a0ffee15c77600"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.19.1/agent-code-review-linux-amd64.tar.gz"
      sha256 "424fa8a4e4b4f4b6e6c5216a9e1a7fc773f7e6a7a2aeb92a16475af6a2e66638"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.19.1", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
