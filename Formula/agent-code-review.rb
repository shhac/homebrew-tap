class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.17.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.17.0/agent-code-review-darwin-arm64.tar.gz"
      sha256 "2b3167686a899af916498ca723518497bdc695943ed216a29abf9f238d7a1735"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.17.0/agent-code-review-darwin-amd64.tar.gz"
      sha256 "e9740fa37773d7637992b03f55c13ebee2d05b655c535b11df38b40221a48237"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.17.0/agent-code-review-linux-arm64.tar.gz"
      sha256 "b96de75cdf4fbf3be287a30dc86592d1a64f48c2ce8a5663403c99f1e8c273ae"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.17.0/agent-code-review-linux-amd64.tar.gz"
      sha256 "5ca179843956af61c32d51d2b04ba1fd20bba8a5ccb716ce1157d88f27d8f9ff"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.17.0", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
