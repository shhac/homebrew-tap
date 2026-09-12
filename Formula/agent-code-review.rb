class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.36.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.36.0/agent-code-review-darwin-arm64.tar.gz"
      sha256 "7575ecf461144ae25f7d90c46bc4f29e42c1c18cce72796c0a085ebcf0c792d9"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.36.0/agent-code-review-darwin-amd64.tar.gz"
      sha256 "691ce936e8718070130127caa58479b0979bce7fc775ed614c9ae96d0bbbb1bc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.36.0/agent-code-review-linux-arm64.tar.gz"
      sha256 "e990a7c495ed74710e345d4a873f16c11322ca81c3c9231db9cd517d897f9246"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.36.0/agent-code-review-linux-amd64.tar.gz"
      sha256 "506d3142359654bc2236ba2baab16026b3db62e314880e3a773c1dfeddcdb3f5"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.36.0", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
