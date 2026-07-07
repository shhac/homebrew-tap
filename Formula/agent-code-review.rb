class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.5.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.5.0/agent-code-review-darwin-arm64.tar.gz"
      sha256 "4a168b9595fb00bf6510628959a957235f08a4403b9107eb9cf913fff21c4054"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.5.0/agent-code-review-darwin-amd64.tar.gz"
      sha256 "f5d8d47d1fa434aa123be644143490b83a43e2330e708cee5d3aaedcf2ee4328"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.5.0/agent-code-review-linux-arm64.tar.gz"
      sha256 "376af5f16e06a031766222607a8fa5e5622c43b86281160a05973f07a0163e87"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.5.0/agent-code-review-linux-amd64.tar.gz"
      sha256 "2978f59b5b0d6f465a347532e93d5fce95e0bbc987c54d6e5129b12bcda7cc20"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.5.0", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
