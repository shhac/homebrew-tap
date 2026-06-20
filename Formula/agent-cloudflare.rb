class AgentCloudflare < Formula
  desc "Cloudflare operations CLI for AI agents"
  homepage "https://github.com/shhac/agent-cloudflare"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.2.0/agent-cloudflare-darwin-arm64.tar.gz"
      sha256 "96c35e194274bfb288e94fdbbaef47989f8ae3de33047eb934edb6226d2c4a23"
    end
    on_intel do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.2.0/agent-cloudflare-darwin-amd64.tar.gz"
      sha256 "fd37f57cdf644e34c3093a46f8dd81ecf727836448cfb4bbb76fb852f28ae55b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.2.0/agent-cloudflare-linux-arm64.tar.gz"
      sha256 "d6e0837d34f387597e8e28437f13c407b30df9adf3d229061a1fb97805695cd7"
    end
    on_intel do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.2.0/agent-cloudflare-linux-amd64.tar.gz"
      sha256 "d9ba0bfb1ad031e11d3bd144905c72e2959912031e68588b6bace565aa960ddd"
    end
  end

  def install
    bin.install Dir["agent-cloudflare-*"].first => "agent-cloudflare"
    # Runs `agent-cloudflare completion bash|zsh|fish` and installs each to brew's
    # standard completion paths. zsh and fish pick them up via the
    # default brew shellenv; bash needs `brew install bash-completion@2`.
    generate_completions_from_executable(bin/"agent-cloudflare", "completion")
  end

  test do
    assert_match "0.2.0", shell_output("#{bin}/agent-cloudflare --version")
    assert_match "agent-cloudflare usage", shell_output("#{bin}/agent-cloudflare usage")
    assert_match "#compdef agent-cloudflare", shell_output("#{bin}/agent-cloudflare completion zsh")
    assert_match "bash completion", shell_output("#{bin}/agent-cloudflare completion bash")
  end
end
