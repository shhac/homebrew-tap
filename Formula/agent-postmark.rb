class AgentPostmark < Formula
  desc "Postmark delivery triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-postmark"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.2.0/agent-postmark-darwin-arm64.tar.gz"
      sha256 "5d5476c0d3fdbfd7794032090aa9975739b79db131d4df901ea75e9bf4f01f0b"
    end
    on_intel do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.2.0/agent-postmark-darwin-amd64.tar.gz"
      sha256 "d3b2c7ef31efe9953f3cd2eb9d1707ac9557a3a7321aad15c0c084677244931d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.2.0/agent-postmark-linux-arm64.tar.gz"
      sha256 "6c4cbdd01c488aac111305fef3f904d9d2c2d9ff2c5a98200e9a4a8b3496a054"
    end
    on_intel do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.2.0/agent-postmark-linux-amd64.tar.gz"
      sha256 "6deac6cc8f5179cc232590914a1da3a940ece31d25fdbf8ca2b94a8671155c0f"
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
    assert_match "0.2.0", shell_output("#{bin}/agent-postmark --version")
    assert_match "agent-postmark", shell_output("#{bin}/agent-postmark usage")
    assert_match "#compdef agent-postmark", shell_output("#{bin}/agent-postmark completion zsh")
    assert_match "bash completion", shell_output("#{bin}/agent-postmark completion bash")
  end
end
