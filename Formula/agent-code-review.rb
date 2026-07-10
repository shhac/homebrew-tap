class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.16.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.16.0/agent-code-review-darwin-arm64.tar.gz"
      sha256 "84c8787f9114aac5414137fd6b6f050f5c0ec67a4a65dcc1fbbcc6bf026204f3"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.16.0/agent-code-review-darwin-amd64.tar.gz"
      sha256 "7d1190570b523b82c37aeccb4963f66f72bc91766b4d84dc1786467f321e9a50"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.16.0/agent-code-review-linux-arm64.tar.gz"
      sha256 "6d9546cc018f1f15332e02ef751ab6b62adab103a0f61ee479b16ba79330c73c"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.16.0/agent-code-review-linux-amd64.tar.gz"
      sha256 "e8faa3c9dec50a5e0c0a25e18ca24beb6b5e864e2f24ac1166c5b8efa817e0af"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.16.0", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
