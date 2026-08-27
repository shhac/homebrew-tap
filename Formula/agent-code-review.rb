class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.31.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.31.0/agent-code-review-darwin-arm64.tar.gz"
      sha256 "b650b896e4bdd7f52bac45da7bb7f9a7fb96ef5cbb0e6fa7524e99c28cba648e"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.31.0/agent-code-review-darwin-amd64.tar.gz"
      sha256 "9572af0f918aded01cabd2440702809a5cb45ae01ea37a318da927fe439d6e77"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.31.0/agent-code-review-linux-arm64.tar.gz"
      sha256 "a1c5898d9c06d73c24378b4de599af8d340f33d06261a4de647f224c93fe646c"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.31.0/agent-code-review-linux-amd64.tar.gz"
      sha256 "07353621a5830f0c1abf92723547a93eb441ad1fbc8537f0b18c724571eaf621"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.31.0", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
