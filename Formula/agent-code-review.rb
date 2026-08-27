class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.31.1"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.31.1/agent-code-review-darwin-arm64.tar.gz"
      sha256 "99a11dac971a1103639fcc63e5ef9e528c298e924cbddbe77287f266579077cc"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.31.1/agent-code-review-darwin-amd64.tar.gz"
      sha256 "bccaad2055dfcd44fbac57f9e3f11f24751c89b8b7036e5e1d6121479feae8ea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.31.1/agent-code-review-linux-arm64.tar.gz"
      sha256 "7f9eb85c13d80d71a2bbfb0fcef15f81d5e4ad976cba66324ecd733fb88f896a"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.31.1/agent-code-review-linux-amd64.tar.gz"
      sha256 "075c997790962e7945b66a1ef2349f53d99e3420b88f6ba1e256662396b9bffc"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.31.1", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
