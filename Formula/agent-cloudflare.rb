class AgentCloudflare < Formula
  desc "Cloudflare operations CLI for AI agents"
  homepage "https://github.com/shhac/agent-cloudflare"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.8.0/agent-cloudflare-darwin-arm64.tar.gz"
      sha256 "f96ac0f9fb9c01494d41a8775d4d1a7e3b48ed93bf8985e7ab12847f11491afa"
    end
    on_intel do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.8.0/agent-cloudflare-darwin-amd64.tar.gz"
      sha256 "aee5bec0a9a9dcdfa2c9f9e4c4123a6a7a55bc6330d6c0907db9443b8c1e1cad"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.8.0/agent-cloudflare-linux-arm64.tar.gz"
      sha256 "a1347a41c887c982cb133545baa370ea05eed23ed18b77e7371cc330c8182a84"
    end
    on_intel do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.8.0/agent-cloudflare-linux-amd64.tar.gz"
      sha256 "a75d4ae4cdc67e1ad2765840313d9e4b9867c73dde56f094c3f51ca71cbab8b0"
    end
  end

  def install
    bin.install "agent-cloudflare"
    # Installs shell completions via `agent-cloudflare completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-cloudflare", "completion")
  end

  test do
    assert_match "0.8.0", shell_output("#{bin}/agent-cloudflare --version")
    assert_match "Cloudflare operations CLI", shell_output("#{bin}/agent-cloudflare --help")
    assert_match "#compdef agent-cloudflare", shell_output("#{bin}/agent-cloudflare completion zsh")
  end
end
