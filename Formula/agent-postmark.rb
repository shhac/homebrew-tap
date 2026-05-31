class AgentPostmark < Formula
  desc "Postmark delivery triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-postmark"
  version "0.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.0.1/agent-postmark-darwin-arm64.tar.gz"
      sha256 "35ee2bfce9546e62855f410bc4f45362405537e5f225cce04f21a45371a801c8"
    end
    on_intel do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.0.1/agent-postmark-darwin-amd64.tar.gz"
      sha256 "aa0d23410e63e70c355c81e83ee56fd228c31f9fe06d21987a6907824e9fd5d2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.0.1/agent-postmark-linux-arm64.tar.gz"
      sha256 "9458de1c8f07bb114c98383fbbcc8a526ef63c3da2c55ef423c3d1bfe5dd90c2"
    end
    on_intel do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.0.1/agent-postmark-linux-amd64.tar.gz"
      sha256 "08aa788c8db03db8b6f686a1360d45c31272e18f3ffd212aac797aa9f8f63bf7"
    end
  end

  def install
    bin.install Dir["agent-postmark-*"].first => "agent-postmark"
    # Runs `agent-postmark completion bash|zsh|fish` and installs each to brew's
    # standard completion paths. zsh and fish pick them up via the
    # default brew shellenv; bash needs `brew install bash-completion@2`.
    generate_completions_from_executable(bin/"agent-postmark", "completion")
  end

  test do
    assert_match "0.0.1", shell_output("#{bin}/agent-postmark --version")
    assert_match "agent-postmark", shell_output("#{bin}/agent-postmark usage")
    assert_match "#compdef agent-postmark", shell_output("#{bin}/agent-postmark completion zsh")
    assert_match "bash completion", shell_output("#{bin}/agent-postmark completion bash")
  end
end
