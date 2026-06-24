class AgentPostmark < Formula
  desc "Postmark delivery triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-postmark"
  version "0.15.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.15.0/agent-postmark-darwin-arm64.tar.gz"
      sha256 "8963711d7fbd4eb1774e28459951bda4e9cc085010c56f98e9a22b22e186b364"
    end
    on_intel do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.15.0/agent-postmark-darwin-amd64.tar.gz"
      sha256 "80b635f5d173a395cb673f0a10f56c21164f06bb8aa3f8646cc5e768d0df38df"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.15.0/agent-postmark-linux-arm64.tar.gz"
      sha256 "ce2f43d2106b51e935da8cf82d337675af7ef5552bace546dd3bec84cec0189c"
    end
    on_intel do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.15.0/agent-postmark-linux-amd64.tar.gz"
      sha256 "667720d9e364df4858db5f9e8941cc1d61dcf183046ade34ba806742a0fd1d92"
    end
  end

  def install
    bin.install "agent-postmark"
    # Installs shell completions via `agent-postmark completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-postmark", "completion")
  end

  test do
    assert_match "0.15.0", shell_output("#{bin}/agent-postmark --version")
    assert_match "Postmark delivery triage CLI", shell_output("#{bin}/agent-postmark --help")
    assert_match "#compdef agent-postmark", shell_output("#{bin}/agent-postmark completion zsh")
  end
end
