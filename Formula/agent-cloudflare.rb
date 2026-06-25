class AgentCloudflare < Formula
  desc "Cloudflare operations CLI for AI agents"
  homepage "https://github.com/shhac/agent-cloudflare"
  version "0.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.11.0/agent-cloudflare-darwin-arm64.tar.gz"
      sha256 "7989b8c8f7fb98ca0f7b2762bd59e705a5d1a0f12e366bbb2b60ae05ff6a2398"
    end
    on_intel do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.11.0/agent-cloudflare-darwin-amd64.tar.gz"
      sha256 "858cd671cb8ccfe562bd23d7e8ef696670fe7221ebde0c86ed96c36c2609410c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.11.0/agent-cloudflare-linux-arm64.tar.gz"
      sha256 "63e3b7c89130676f95107bdd33872aa3d4ee7d6530ccec65f2973b9ae7affc53"
    end
    on_intel do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.11.0/agent-cloudflare-linux-amd64.tar.gz"
      sha256 "df914b8f770ec5a83ddd2ce5630ed3a2d6f9f5c1c0123ef5ed2ed08872fd92e0"
    end
  end

  def install
    bin.install "agent-cloudflare"
    # Installs shell completions via `agent-cloudflare completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-cloudflare", "completion")
  end

  test do
    assert_match "0.11.0", shell_output("#{bin}/agent-cloudflare --version")
    assert_match "Cloudflare operations CLI", shell_output("#{bin}/agent-cloudflare --help")
    assert_match "#compdef agent-cloudflare", shell_output("#{bin}/agent-cloudflare completion zsh")
  end
end
