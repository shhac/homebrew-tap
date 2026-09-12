class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.38.1"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.38.1/agent-code-review-darwin-arm64.tar.gz"
      sha256 "23e23ed38b58d5c45d8a4ce60177fed72fe1799926f61154592f35199b55fe02"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.38.1/agent-code-review-darwin-amd64.tar.gz"
      sha256 "05aff29ab52e07b6a65ce50253e1087de21dd73f537bc1f0b0f18f2a1d818d88"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.38.1/agent-code-review-linux-arm64.tar.gz"
      sha256 "9f6feb75836ebcb60f4e64c09d8b8d7b2ff26f55d42b8a47e663fef697bcef0f"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.38.1/agent-code-review-linux-amd64.tar.gz"
      sha256 "af902ef6ea9a96784cd853cd97cc74dbfcf3bed90ededcea52bbdeda9b72dc0b"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.38.1", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
