class AgentCloudflare < Formula
  desc "Cloudflare operations CLI for AI agents"
  homepage "https://github.com/shhac/agent-cloudflare"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.7.0/agent-cloudflare-darwin-arm64.tar.gz"
      sha256 "4a3dca0b0ee0a64745d744daff2a2c5587b40a0863f778e5265c59808f5b6fbb"
    end
    on_intel do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.7.0/agent-cloudflare-darwin-amd64.tar.gz"
      sha256 "83e392fd8b03271e1d2dc4e361832ed88d21271e9112757bbe38f09a065bf56e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.7.0/agent-cloudflare-linux-arm64.tar.gz"
      sha256 "11bd8742717fc10699b92bfe7cf5fe1595634cf66e223cd110f074a4621ea625"
    end
    on_intel do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.7.0/agent-cloudflare-linux-amd64.tar.gz"
      sha256 "0cedfaaf6339b183fc3fc4641d52c103c214c166f595ab5569c51bddc21e27ea"
    end
  end

  def install
    bin.install "agent-cloudflare"
    # Installs shell completions via `agent-cloudflare completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-cloudflare", "completion")
  end

  test do
    assert_match "0.7.0", shell_output("#{bin}/agent-cloudflare --version")
    assert_match "Cloudflare operations CLI", shell_output("#{bin}/agent-cloudflare --help")
    assert_match "#compdef agent-cloudflare", shell_output("#{bin}/agent-cloudflare completion zsh")
  end
end
