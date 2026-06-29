class AgentCloudflare < Formula
  desc "Cloudflare operations CLI for AI agents"
  homepage "https://github.com/shhac/agent-cloudflare"
  version "0.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.12.0/agent-cloudflare-darwin-arm64.tar.gz"
      sha256 "e9fdd37997ba44ecf9e6b64ebdb1e5603b1e5722c52d984d39cba1a3600652bd"
    end
    on_intel do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.12.0/agent-cloudflare-darwin-amd64.tar.gz"
      sha256 "db74e75c21b3a38a1ede536faff5bb50860d002104289fd49227d48a5b230588"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.12.0/agent-cloudflare-linux-arm64.tar.gz"
      sha256 "7198e88bed76413eafa59d355677e39068b0ebb55367c3c3f5c349510e585535"
    end
    on_intel do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.12.0/agent-cloudflare-linux-amd64.tar.gz"
      sha256 "43e9099d1ab7defb061bd06d2ddb01b3c6fa68f1ee50a6f5d0bb33c4403e972b"
    end
  end

  def install
    bin.install "agent-cloudflare"
    # Installs shell completions via `agent-cloudflare completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-cloudflare", "completion")
  end

  test do
    assert_match "0.12.0", shell_output("#{bin}/agent-cloudflare --version")
    assert_match "Cloudflare operations CLI", shell_output("#{bin}/agent-cloudflare --help")
    assert_match "#compdef agent-cloudflare", shell_output("#{bin}/agent-cloudflare completion zsh")
  end
end
