class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.43.0/agent-code-review-darwin-arm64.tar.gz"
      sha256 "c0fea45d7200827cb7824c6e19764f2207f43c5cbd88121647c93ad5d576113d"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.43.0/agent-code-review-darwin-amd64.tar.gz"
      sha256 "470fecd8f41a0edc273e6b1b0201b07de9b14e475fed7d46dfbcf07a8c64552b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.43.0/agent-code-review-linux-arm64.tar.gz"
      sha256 "3aa5e03ec0f515e7ec3d515152e913ff60ca544849f91dca1dcc401c24169390"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.43.0/agent-code-review-linux-amd64.tar.gz"
      sha256 "72efcc716788bfd445ba3faf59682c45570303c9628d909261f0f891ed9c9882"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.43.0", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
