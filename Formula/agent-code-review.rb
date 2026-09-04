class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.32.2"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.32.2/agent-code-review-darwin-arm64.tar.gz"
      sha256 "c0c5b310f4f95c22f70ed1284b649880048e8f314b8f2c405d6e106c1a5b4cbd"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.32.2/agent-code-review-darwin-amd64.tar.gz"
      sha256 "8806d2dda8d44433c728288d59720dea37bf6600d3980a30c07f3aa250bd335e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.32.2/agent-code-review-linux-arm64.tar.gz"
      sha256 "6dd23c19631725eda99a6c997e99247f9f1d044e0ebaa7182d8d90c3446aac66"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.32.2/agent-code-review-linux-amd64.tar.gz"
      sha256 "2061e2877ba6f9ed605b807b2f7bb9920e19a6b06eb588d6c93cd5ead878442b"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.32.2", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
