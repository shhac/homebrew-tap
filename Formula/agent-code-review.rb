class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.4.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.4.0/agent-code-review-darwin-arm64.tar.gz"
      sha256 "2908e17dab9f4999a56b1ee84d8c0cb28f61fe65ded22f667fd633e00b00e519"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.4.0/agent-code-review-darwin-amd64.tar.gz"
      sha256 "72d6f87d21d1f072574bf479ce15f28197acc1d799d7b5824a71a85aed160a39"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.4.0/agent-code-review-linux-arm64.tar.gz"
      sha256 "845fc32159f6ba10eceaf45a39e97a6a800dbc5dcae5fd8d22118c5653160a77"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.4.0/agent-code-review-linux-amd64.tar.gz"
      sha256 "b137c9e587bf6d6e30d62a2717588022ef61c2fc6f523e7fb467c774b8fc53f6"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.4.0", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
