class AgentCloudflare < Formula
  desc "Cloudflare operations CLI for AI agents"
  homepage "https://github.com/shhac/agent-cloudflare"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.3.1/agent-cloudflare-darwin-arm64.tar.gz"
      sha256 "46d170cbdf84264d0777aed8a26d469e499402f30141cb212dc42f584d0ae020"
    end
    on_intel do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.3.1/agent-cloudflare-darwin-amd64.tar.gz"
      sha256 "bd18d0aed536f412c849b9f3b0cd3f8edca5df497978cb1343258e487d1ce19c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.3.1/agent-cloudflare-linux-arm64.tar.gz"
      sha256 "5d8c8826609583bf481eabe95c2b2ca7491ccf33733bcd795e2288d7601c5d94"
    end
    on_intel do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.3.1/agent-cloudflare-linux-amd64.tar.gz"
      sha256 "ec9ea73162cc506e59e724217d9d482cbb5f8524ed17a47b6826635a9164a3be"
    end
  end

  def install
    bin.install "agent-cloudflare"
    # Installs shell completions via `agent-cloudflare completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-cloudflare", "completion")
  end

  test do
    assert_match "0.3.1", shell_output("#{bin}/agent-cloudflare --version")
    assert_match "Cloudflare operations CLI", shell_output("#{bin}/agent-cloudflare --help")
    assert_match "#compdef agent-cloudflare", shell_output("#{bin}/agent-cloudflare completion zsh")
  end
end
