class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.40.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.40.0/agent-code-review-darwin-arm64.tar.gz"
      sha256 "2655fd47135e6facd2e4d6842c759146f2b362e0147bc983eead10147cdd8818"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.40.0/agent-code-review-darwin-amd64.tar.gz"
      sha256 "b555860a10269fd410fddac050ff6dbe9f7f9894804ee460b399755082f4a7fb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.40.0/agent-code-review-linux-arm64.tar.gz"
      sha256 "565ca40c8dac7f67770653f4ca39d5150aaa5adb402ca956e0500fb4b6aca842"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.40.0/agent-code-review-linux-amd64.tar.gz"
      sha256 "f7e1ff1150bef28e2269f1dc12adcf379018d79e0919d21e121f89dd695fda84"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.40.0", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
