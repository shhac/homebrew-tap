class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.30.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.30.0/agent-code-review-darwin-arm64.tar.gz"
      sha256 "a04f4057165f215d4a88be7420e99a042abd003f718dfcbed8750c8718483e20"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.30.0/agent-code-review-darwin-amd64.tar.gz"
      sha256 "d4fd2ad77df1070dcf2d1bb379783d95b88515aa60fe966b2383960b7122a248"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.30.0/agent-code-review-linux-arm64.tar.gz"
      sha256 "7a0e07a2ce2769edb2a6a6265726721d84ab907c8118e29d4aef0920a8f08585"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.30.0/agent-code-review-linux-amd64.tar.gz"
      sha256 "4b84ff361203541453010abed8d923c9ab715f773e40f68e37d36385cb2692eb"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.30.0", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
