class AgentCloudflare < Formula
  desc "Cloudflare operations CLI for AI agents"
  homepage "https://github.com/shhac/agent-cloudflare"
  version "0.12.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.12.1/agent-cloudflare-darwin-arm64.tar.gz"
      sha256 "09c9ac95c8a08e53a9be3afb3936963fe9001ca68f79a7ab20af23574f77f5b6"
    end
    on_intel do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.12.1/agent-cloudflare-darwin-amd64.tar.gz"
      sha256 "1d2fb9d4b5fab943fb13bba508056603b28cf4c73b849fceaded6e6d0f384153"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.12.1/agent-cloudflare-linux-arm64.tar.gz"
      sha256 "afa26d3a8474bfcc9fdd2fb051c1453329f994f1991e325259f2e490ee169060"
    end
    on_intel do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.12.1/agent-cloudflare-linux-amd64.tar.gz"
      sha256 "0e5dcdf1e21b2295ebce3322f1bbd1cca0a01abdcccb5c48d4e18c8a32e9895f"
    end
  end

  def install
    bin.install "agent-cloudflare"
    # Installs shell completions via `agent-cloudflare completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-cloudflare", "completion")
  end

  test do
    assert_match "0.12.1", shell_output("#{bin}/agent-cloudflare --version")
    assert_match "Cloudflare operations CLI", shell_output("#{bin}/agent-cloudflare --help")
    assert_match "#compdef agent-cloudflare", shell_output("#{bin}/agent-cloudflare completion zsh")
  end
end
