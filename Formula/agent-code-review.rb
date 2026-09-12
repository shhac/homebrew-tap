class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.36.3"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.36.3/agent-code-review-darwin-arm64.tar.gz"
      sha256 "065a20ae2686a64ba4f649b18ff947b36d1cdda49fc996dca217919fdcc5c420"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.36.3/agent-code-review-darwin-amd64.tar.gz"
      sha256 "4f4388882a88af994e5d1aaa524dd9836e2c95730d7b6038a41b7a19e2057b3a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.36.3/agent-code-review-linux-arm64.tar.gz"
      sha256 "7b446504ca2b79a97f4a58a5aa962a0822e6d4a89a1f7361eb883069f933f24f"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.36.3/agent-code-review-linux-amd64.tar.gz"
      sha256 "cf274b27647e9e78b4a8a3e6a38520eab92c0522562588bb859c1efa0d812b77"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.36.3", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
