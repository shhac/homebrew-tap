class AgentCloudflare < Formula
  desc "Cloudflare operations CLI for AI agents"
  homepage "https://github.com/shhac/agent-cloudflare"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.6.0/agent-cloudflare-darwin-arm64.tar.gz"
      sha256 "8f4ce289622d81358f2d31cac3c0d0196bcab110745d0a73a0fac653c426237c"
    end
    on_intel do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.6.0/agent-cloudflare-darwin-amd64.tar.gz"
      sha256 "abc603d5357b408c6cdf8403ecf3856f592a6f3205a89a04344ed261e366df3a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.6.0/agent-cloudflare-linux-arm64.tar.gz"
      sha256 "293c1d7de32f5051b720a959bac876126d6cc8bed659a46a08c58088a8238cea"
    end
    on_intel do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.6.0/agent-cloudflare-linux-amd64.tar.gz"
      sha256 "344c1f8330770fc136e2b43b5e15605ad7c75c1e6baf4611757d3ebe4eabce16"
    end
  end

  def install
    bin.install "agent-cloudflare"
    # Installs shell completions via `agent-cloudflare completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-cloudflare", "completion")
  end

  test do
    assert_match "0.6.0", shell_output("#{bin}/agent-cloudflare --version")
    assert_match "Cloudflare operations CLI", shell_output("#{bin}/agent-cloudflare --help")
    assert_match "#compdef agent-cloudflare", shell_output("#{bin}/agent-cloudflare completion zsh")
  end
end
