class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.32.1"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.32.1/agent-code-review-darwin-arm64.tar.gz"
      sha256 "5f4c2510caf38a9f3d3e24e8d5843e991883b0b57114148d33ac75c39fe83dcd"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.32.1/agent-code-review-darwin-amd64.tar.gz"
      sha256 "a0427d324e9bee33dc80e661afea7ed57c0350a488d5d8bdf41d71dfee95ad43"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.32.1/agent-code-review-linux-arm64.tar.gz"
      sha256 "b96f6f79098fd7a115f8e52cb1b4674aca2d036f4412ca30f90b76d248f31bd8"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.32.1/agent-code-review-linux-amd64.tar.gz"
      sha256 "326a32870dd9bb7edb7ebc7ff9a000a7297fe466e6cf1ad196ef30533f7c65d3"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.32.1", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
