class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.29.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.29.0/agent-code-review-darwin-arm64.tar.gz"
      sha256 "ac1a55089aaaa2a6de046a8b90675a663e5c9ba743271316748b5261931af106"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.29.0/agent-code-review-darwin-amd64.tar.gz"
      sha256 "195147d770ae1667e1483a389e7deea7435120b70005bfd1e0d277c7a5727456"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.29.0/agent-code-review-linux-arm64.tar.gz"
      sha256 "b3a8ccaf68c73b107acd0978860fdfcbf30453c7dac9616f4ba6cd513390c171"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.29.0/agent-code-review-linux-amd64.tar.gz"
      sha256 "3b5e298cd4fc29f32a28fe837cf8f0897773b51bac092d75e6e629c26b3b789d"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.29.0", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
