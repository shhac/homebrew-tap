class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.20.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.20.0/agent-code-review-darwin-arm64.tar.gz"
      sha256 "e022c34867148313e0d9a7a70f1cedd2cacb8a8ba4fc58f64be3502264f38916"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.20.0/agent-code-review-darwin-amd64.tar.gz"
      sha256 "b7b9890d368bc24a10efe6bd3c8aaa15d21d1a4660953ca6864db0fcbc815733"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.20.0/agent-code-review-linux-arm64.tar.gz"
      sha256 "10ec5e97a4a7f254d05b0d4ac395b56758c90070dcaf074e985334b60935b78f"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.20.0/agent-code-review-linux-amd64.tar.gz"
      sha256 "3319d9cdb77d9b3b5f79c0a6dd769ea702aa910e79fbea30214e044e75925a5b"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.20.0", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
