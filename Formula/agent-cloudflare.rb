class AgentCloudflare < Formula
  desc "Cloudflare operations CLI for AI agents"
  homepage "https://github.com/shhac/agent-cloudflare"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.5.0/agent-cloudflare-darwin-arm64.tar.gz"
      sha256 "64228623e713c2e21c8ab9f7a64e80bfc44ebbcfa2c4ee9f8bd944fab70e29b8"
    end
    on_intel do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.5.0/agent-cloudflare-darwin-amd64.tar.gz"
      sha256 "3c7fe2e1cb6b95d97e9b19e1e55ea7aad74b00acb0294508e7b706da0698ba54"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.5.0/agent-cloudflare-linux-arm64.tar.gz"
      sha256 "a71ad1ab1d267f2163f65f757ef929037f33b11898b026828237af68d2722267"
    end
    on_intel do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.5.0/agent-cloudflare-linux-amd64.tar.gz"
      sha256 "af2329041ecf75287eb87cfa1cd9266e900e160124479b1a69b7a1448fbaf2b8"
    end
  end

  def install
    bin.install "agent-cloudflare"
    # Installs shell completions via `agent-cloudflare completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-cloudflare", "completion")
  end

  test do
    assert_match "0.5.0", shell_output("#{bin}/agent-cloudflare --version")
    assert_match "Cloudflare operations CLI", shell_output("#{bin}/agent-cloudflare --help")
    assert_match "#compdef agent-cloudflare", shell_output("#{bin}/agent-cloudflare completion zsh")
  end
end
