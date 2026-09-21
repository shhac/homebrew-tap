class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.42.1/agent-code-review-darwin-arm64.tar.gz"
      sha256 "3ef2836af22c842df3b20fb9f639ea13961e5b130524f8366b18fc6467b56937"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.42.1/agent-code-review-darwin-amd64.tar.gz"
      sha256 "ba8430ed02666cb1db889d9025c8e05ceb8f7d71675f043e5c2974d6a7caef83"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.42.1/agent-code-review-linux-arm64.tar.gz"
      sha256 "ba157f16608a5294790a29102f5c63f42628335ecac5dfdbc11cb4ccb5defc8f"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.42.1/agent-code-review-linux-amd64.tar.gz"
      sha256 "b3a9b6f6aea37d1928f007e504d380f3fb287975448c08806f800e1a1329a7bc"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.42.1", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
