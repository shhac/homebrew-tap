class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.13.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.13.0/agent-code-review-darwin-arm64.tar.gz"
      sha256 "bd7f35c834083d0865f3ba64f848c472b7ece3b145283ba21037a91a281b3f79"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.13.0/agent-code-review-darwin-amd64.tar.gz"
      sha256 "7e902280947fec04cd8101cec22aa6bc60b3fe72d0109b12a5044bd116f964cd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.13.0/agent-code-review-linux-arm64.tar.gz"
      sha256 "23015946ac344f1c87f1e1ea3a47862194609cd48cb37c7f2a40429684c8bc38"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.13.0/agent-code-review-linux-amd64.tar.gz"
      sha256 "71830fa4c3227bb7af3ff08ef8297d1b2c935af44679ba23e55157f5593ab041"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.13.0", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
