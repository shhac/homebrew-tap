class AgentCloudflare < Formula
  desc "Cloudflare operations CLI for AI agents"
  homepage "https://github.com/shhac/agent-cloudflare"
  version "0.8.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.8.1/agent-cloudflare-darwin-arm64.tar.gz"
      sha256 "32f818932ad5e480c2a93440dee172f294ff7ea38cde3758d0bd9ab93c571da6"
    end
    on_intel do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.8.1/agent-cloudflare-darwin-amd64.tar.gz"
      sha256 "6e1eedad8dc3d952d758560aefb4767109d3810c496613233256427c376fdee1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.8.1/agent-cloudflare-linux-arm64.tar.gz"
      sha256 "5b59c8c9fe6adb22db3083b6372d9951c471403343653ac714165aa0b021b65b"
    end
    on_intel do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.8.1/agent-cloudflare-linux-amd64.tar.gz"
      sha256 "b894af6b329547e2afdbb880959bdf7769842dd46016cf315c5234bad816de29"
    end
  end

  def install
    bin.install "agent-cloudflare"
    # Installs shell completions via `agent-cloudflare completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-cloudflare", "completion")
  end

  test do
    assert_match "0.8.1", shell_output("#{bin}/agent-cloudflare --version")
    assert_match "Cloudflare operations CLI", shell_output("#{bin}/agent-cloudflare --help")
    assert_match "#compdef agent-cloudflare", shell_output("#{bin}/agent-cloudflare completion zsh")
  end
end
