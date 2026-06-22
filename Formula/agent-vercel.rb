class AgentVercel < Formula
  desc "Vercel CLI for AI agents"
  homepage "https://github.com/shhac/agent-vercel"
  version "0.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.12.0/agent-vercel-darwin-arm64.tar.gz"
      sha256 "a98853cd81e60a5067fcb79b8328d26799bc38559fff7ba47a2f92a5dffe9eb9"
    end
    on_intel do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.12.0/agent-vercel-darwin-amd64.tar.gz"
      sha256 "854e0ff1b5f547fb7d6db5ab053db13fe6966897c0652c8cd8d21a6d72044922"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.12.0/agent-vercel-linux-arm64.tar.gz"
      sha256 "0e513eb0bbcf7717b50f5de46d3d96afe590131feca381dd36d096c4ffa89a69"
    end
    on_intel do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.12.0/agent-vercel-linux-amd64.tar.gz"
      sha256 "b9c3b402e9c2e130c2556af20c13e51d4b6c10060aa8c5f5c5fbeb95c76e9ae2"
    end
  end

  def install
    bin.install "agent-vercel"
    # Installs shell completions via `agent-vercel completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-vercel", "completion")
  end

  test do
    assert_match "0.12.0", shell_output("#{bin}/agent-vercel --version")
    assert_match "Vercel CLI for AI agents", shell_output("#{bin}/agent-vercel --help")
    assert_match "#compdef agent-vercel", shell_output("#{bin}/agent-vercel completion zsh")
  end
end
