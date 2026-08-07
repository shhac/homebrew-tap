class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.30.2"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.30.2/agent-code-review-darwin-arm64.tar.gz"
      sha256 "726d6ecd154186cdd3376959f4060b5095bb787ffd4bfcafd4953be3815f1449"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.30.2/agent-code-review-darwin-amd64.tar.gz"
      sha256 "60aed9f377e84d10cd49a3de84a072e8fed4340854e735171ac23974e6be9514"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.30.2/agent-code-review-linux-arm64.tar.gz"
      sha256 "63fe49cdda8c2692921301a2b39511d01194bfa45aee6fa9c828816ca22c8140"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.30.2/agent-code-review-linux-amd64.tar.gz"
      sha256 "9d3a97a91da9d6012920de196d74f165b0f2f695963b8b7692d4d5a32130919c"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.30.2", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
