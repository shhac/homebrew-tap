class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.11.1"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.11.1/agent-code-review-darwin-arm64.tar.gz"
      sha256 "6b0d47484e04217fc93da2f06c178c93acb303de7936c00cfd708507226861a1"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.11.1/agent-code-review-darwin-amd64.tar.gz"
      sha256 "80180bf752bb33872b9b0a8f93c460378e20aa5252353599a22e0da2ef20f4ca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.11.1/agent-code-review-linux-arm64.tar.gz"
      sha256 "8e7baf068a5ea608177edd06582c600ecb418e68f367ba5e4c60ce15afe45efc"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.11.1/agent-code-review-linux-amd64.tar.gz"
      sha256 "abd8b70362c86e9249db99dce59b59df9301b39ae0b839c075aa5679b55d2ddb"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.11.1", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
