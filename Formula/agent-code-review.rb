class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.11.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.11.0/agent-code-review-darwin-arm64.tar.gz"
      sha256 "f3c734a223ca8e00e58266b6678c7135b97479fe1ba2a128f26e9bca001ab8bc"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.11.0/agent-code-review-darwin-amd64.tar.gz"
      sha256 "1306ffa7b48f93947407f1f91591698a433776dc693f7e006d550269d95dca42"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.11.0/agent-code-review-linux-arm64.tar.gz"
      sha256 "3d2600d55c2d07f4829a5b6e87bedc2bdc561095f36ec3913f3bbb4d42d77bf1"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.11.0/agent-code-review-linux-amd64.tar.gz"
      sha256 "f58afd14f79901462d6b4be9df85b89046c34c2e4b022795cc888d6719e12b51"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.11.0", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
