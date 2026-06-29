class AgentVercel < Formula
  desc "Vercel CLI for AI agents"
  homepage "https://github.com/shhac/agent-vercel"
  version "0.14.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.14.1/agent-vercel-darwin-arm64.tar.gz"
      sha256 "6077f20a4ef3d10900c1f4f9d8fd607c128c65f05f8d35145a042d0b49020a4c"
    end
    on_intel do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.14.1/agent-vercel-darwin-amd64.tar.gz"
      sha256 "29eb1776c1e39766cd855237a6c86d43c494337f0baa0e39e9a17d69805e8d85"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.14.1/agent-vercel-linux-arm64.tar.gz"
      sha256 "bc763f7f828c081ea8a15f1743308e90441f0df090bb51dac576218aef340eaa"
    end
    on_intel do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.14.1/agent-vercel-linux-amd64.tar.gz"
      sha256 "15f04bb35a2b71e17e5ec8bc966525612a86ad8154ce353a4fcf9100ab918ab5"
    end
  end

  def install
    bin.install "agent-vercel"
    # Installs shell completions via `agent-vercel completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-vercel", "completion")
  end

  test do
    assert_match "0.14.1", shell_output("#{bin}/agent-vercel --version")
    assert_match "Vercel CLI for AI agents", shell_output("#{bin}/agent-vercel --help")
    assert_match "#compdef agent-vercel", shell_output("#{bin}/agent-vercel completion zsh")
  end
end
