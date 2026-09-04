class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.32.3"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.32.3/agent-code-review-darwin-arm64.tar.gz"
      sha256 "1389fd044b6be49a3ce6657cdfa7635fa470a118c0fcfc4c58cf089eb9fbd0c9"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.32.3/agent-code-review-darwin-amd64.tar.gz"
      sha256 "24146e57d48dea80364dd7905430001542f95a05e18038ebcea058849180d2ec"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.32.3/agent-code-review-linux-arm64.tar.gz"
      sha256 "d673f35bada2000fc7adc78b15acee346ee460a4ab857ed89896415e7d9ff60f"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.32.3/agent-code-review-linux-amd64.tar.gz"
      sha256 "a881782c92d581d216817df1cf7b2b3489a9d228004fdecd7af581748f69d494"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.32.3", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
