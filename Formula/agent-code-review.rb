class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.33.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.33.0/agent-code-review-darwin-arm64.tar.gz"
      sha256 "1c27409666b880c768490fe05ef8767556c4ac3fe06fc2940739c784cdf315c0"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.33.0/agent-code-review-darwin-amd64.tar.gz"
      sha256 "4c571e935b4a4628223a3a984935fa9ee09c819856fc5dd7f5ca59a6ce4689f8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.33.0/agent-code-review-linux-arm64.tar.gz"
      sha256 "b26ba7ba32b83822c098e1ed20fe04e5a2b9601e30676603857f127584517340"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.33.0/agent-code-review-linux-amd64.tar.gz"
      sha256 "1eddcd3be8a2c9ccce744b393e1cee62dd8e6268944dc5d5df584e97115a7136"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.33.0", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
