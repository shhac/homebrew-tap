class AgentPostmark < Formula
  desc "Postmark delivery triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-postmark"
  version "0.14.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.14.0/agent-postmark-darwin-arm64.tar.gz"
      sha256 "5f5fe0b280889016e2be7c53a813b2d417e7cd1332ed329a6a311277ab67b83e"
    end
    on_intel do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.14.0/agent-postmark-darwin-amd64.tar.gz"
      sha256 "aab1ef8d848a5a0aa93ffd06ac6c9ea8cb83c0d5d6840986e966ee22526ff42e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.14.0/agent-postmark-linux-arm64.tar.gz"
      sha256 "8ca01c0dc136b7432b3918c358e4bb7314c5bd27995567ffc23f0f6b2cc72a5a"
    end
    on_intel do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.14.0/agent-postmark-linux-amd64.tar.gz"
      sha256 "04cfa61b1ec91b06c1f452effc78e548c0e392e5f9d4483669f4579301176e89"
    end
  end

  def install
    bin.install "agent-postmark"
    # Installs shell completions via `agent-postmark completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-postmark", "completion")
  end

  test do
    assert_match "0.14.0", shell_output("#{bin}/agent-postmark --version")
    assert_match "Postmark delivery triage CLI", shell_output("#{bin}/agent-postmark --help")
    assert_match "#compdef agent-postmark", shell_output("#{bin}/agent-postmark completion zsh")
  end
end
