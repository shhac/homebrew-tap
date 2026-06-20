class AgentPostmark < Formula
  desc "Postmark delivery triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-postmark"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.4.0/agent-postmark-darwin-arm64.tar.gz"
      sha256 "c5c319f9628d50e740cda409534d0a68eb89c8f6b9599dfe024118c1aeb83bb7"
    end
    on_intel do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.4.0/agent-postmark-darwin-amd64.tar.gz"
      sha256 "e8e5b84fbba60d87bc1c20ef02500425431f4ee70ade9dbfa67c1710af12c75b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.4.0/agent-postmark-linux-arm64.tar.gz"
      sha256 "f241204d8a943ecf9be807c5d47abfb3168bdf50da1f8ec2cc9ed5e3fe5222da"
    end
    on_intel do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.4.0/agent-postmark-linux-amd64.tar.gz"
      sha256 "e823bea2de6744b93b1c80344d5d46e24d682b8641d7c8bf908e53c90fb46fe4"
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
    assert_match "0.4.0", shell_output("#{bin}/agent-postmark --version")
    assert_match "agent-postmark", shell_output("#{bin}/agent-postmark usage")
    assert_match "#compdef agent-postmark", shell_output("#{bin}/agent-postmark completion zsh")
    assert_match "bash completion", shell_output("#{bin}/agent-postmark completion bash")
  end
end
