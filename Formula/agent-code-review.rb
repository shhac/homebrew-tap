class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.36.2"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.36.2/agent-code-review-darwin-arm64.tar.gz"
      sha256 "424835eb8db53226e8d9f571d6dea68823f9796f234519e1306987ae0bb81a9e"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.36.2/agent-code-review-darwin-amd64.tar.gz"
      sha256 "0ddc04fa5d3ac620a6c3b39c80ebd09300d03d97eea0da99e2fff0571cd288ea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.36.2/agent-code-review-linux-arm64.tar.gz"
      sha256 "b50292d4b1482149445a0e7ed0c8ab2c1e6c26bd33b070246493a06eeab849e7"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.36.2/agent-code-review-linux-amd64.tar.gz"
      sha256 "2ff5ecbef2d83f1598a9f565a7651b379cb534fa564e5d5a6d08406d6e4fd237"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.36.2", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
