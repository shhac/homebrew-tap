class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.28.1"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.28.1/agent-code-review-darwin-arm64.tar.gz"
      sha256 "dbfcf95b829d523b9b6e1b1a8fbfff0c84db2138e0889308e5492b695453e762"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.28.1/agent-code-review-darwin-amd64.tar.gz"
      sha256 "f185c85dc4b4c50b4e4a68002d6fca2667bd1e52d61dbb77bac17ededca03220"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.28.1/agent-code-review-linux-arm64.tar.gz"
      sha256 "7325ca43da9a3c632ba1a2bf90262baf783726dc394b5f1d06a281c5c32d957c"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.28.1/agent-code-review-linux-amd64.tar.gz"
      sha256 "be04350f9f204e408028d46fbd8ca901cfcc741b4f095efab0adb41372a892dd"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.28.1", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
