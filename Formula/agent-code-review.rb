class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.10.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.10.0/agent-code-review-darwin-arm64.tar.gz"
      sha256 "2b78cadf7ec6dbfa33840b7521f2a79b5c53aa99c90038de5c4c1d6a41811fea"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.10.0/agent-code-review-darwin-amd64.tar.gz"
      sha256 "5fff2ea25d871da3f09cc6a1a069a6a76247ee5360d04ce47996016030dd2fb2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.10.0/agent-code-review-linux-arm64.tar.gz"
      sha256 "6ccc2d523116bfe31842a6561e748d5f0ab11836d5450a793f27079f8f16dd7a"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.10.0/agent-code-review-linux-amd64.tar.gz"
      sha256 "043e5f986e548466b9174a3d5e30619e4a9c3e2db92635f85dd41ec3f641f618"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.10.0", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
