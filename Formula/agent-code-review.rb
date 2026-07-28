class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.22.2"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.22.2/agent-code-review-darwin-arm64.tar.gz"
      sha256 "64f0344ae127eb5a247b64ea48e01629f90ae2370ba75912d5b5a90fdbd58bdc"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.22.2/agent-code-review-darwin-amd64.tar.gz"
      sha256 "180b54e6765596659c2a2379eb6db8f834bc33ed42b6d79206724ec1372195dd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.22.2/agent-code-review-linux-arm64.tar.gz"
      sha256 "383a815da985240807cb651bf1dff170dc54c54e5f1e3ecbe2af79ab4cccf857"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.22.2/agent-code-review-linux-amd64.tar.gz"
      sha256 "79bbe511f9c49588edb794df6690c4ccadb02e1f7270aa838e0753c4e91c9ee4"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.22.2", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
