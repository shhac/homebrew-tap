class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.34.1"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.34.1/agent-code-review-darwin-arm64.tar.gz"
      sha256 "68895ffc79a717f3c255635f495162b25e70a726efcc7dd2bb0596a87aa03758"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.34.1/agent-code-review-darwin-amd64.tar.gz"
      sha256 "8f79d6894f96c60db6eeec205612a1432e749875a7010c03d9c3b0c67e5b9d4e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.34.1/agent-code-review-linux-arm64.tar.gz"
      sha256 "a4e021579109ec4cd16bc877ae11990f3043fde8cd4c40d8a123885267382f0a"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.34.1/agent-code-review-linux-amd64.tar.gz"
      sha256 "22d980a03f23c942513f1806b99719b46f7b680a8be36f872195027188263462"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.34.1", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
