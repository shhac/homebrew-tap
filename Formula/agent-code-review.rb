class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.30.1"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.30.1/agent-code-review-darwin-arm64.tar.gz"
      sha256 "97049db7412fe4666b30b3359f6e93eca39910c8ff8d1fc9eb9741d35228b8a4"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.30.1/agent-code-review-darwin-amd64.tar.gz"
      sha256 "706c40798a219d940a7e6dbbe60094a426a3fbad1ee1323fc5167028c545ecc5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.30.1/agent-code-review-linux-arm64.tar.gz"
      sha256 "cf7cad81bed2c013415484ad6b896e14b9ce87685d281a6b0b2199583299e29d"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.30.1/agent-code-review-linux-amd64.tar.gz"
      sha256 "4da31b2d3be73ca9e7a14a3ca9ae5488c4a7c56038cc08043b6a76f602c97f98"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.30.1", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
