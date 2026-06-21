class AgentCloudflare < Formula
  desc "Cloudflare operations CLI for AI agents"
  homepage "https://github.com/shhac/agent-cloudflare"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.4.0/agent-cloudflare-darwin-arm64.tar.gz"
      sha256 "1f8c0a970bcdc4ead46a1335b0348a2788240e8168034142e19484c9f2f0223f"
    end
    on_intel do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.4.0/agent-cloudflare-darwin-amd64.tar.gz"
      sha256 "7230f059ceb1b0668e9fc9b4b63b881e4283fe7d44dac45df25ead83add7d93c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.4.0/agent-cloudflare-linux-arm64.tar.gz"
      sha256 "1078efc44465233a870d131f62dcddef30f04fbb95b021ae77519aba04723bcc"
    end
    on_intel do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.4.0/agent-cloudflare-linux-amd64.tar.gz"
      sha256 "a4826962c3f13a39bfd4ac451292538256b1909eb304edd6454b9c7f84236d8c"
    end
  end

  def install
    bin.install "agent-cloudflare"
    # Installs shell completions via `agent-cloudflare completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-cloudflare", "completion")
  end

  test do
    assert_match "0.4.0", shell_output("#{bin}/agent-cloudflare --version")
    assert_match "Cloudflare operations CLI", shell_output("#{bin}/agent-cloudflare --help")
    assert_match "#compdef agent-cloudflare", shell_output("#{bin}/agent-cloudflare completion zsh")
  end
end
