class AgentCloudflare < Formula
  desc "Cloudflare operations CLI for AI agents"
  homepage "https://github.com/shhac/agent-cloudflare"
  version "0.1.0"
  license "MIT"
  revision 1

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.1.0/agent-cloudflare-darwin-arm64.tar.gz"
      sha256 "c4259282366be56a69e34c40decf1101f29a9d1538d7d0807423b6a212172c9f"
    end
    on_intel do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.1.0/agent-cloudflare-darwin-amd64.tar.gz"
      sha256 "a564747856ad6d020586723e76086d899f362d5530ae8524599898e68c535d75"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.1.0/agent-cloudflare-linux-arm64.tar.gz"
      sha256 "ca18e15872ebcb1cadb039c1177beb61cfdcbcc4611552d8e250547011662a43"
    end
    on_intel do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.1.0/agent-cloudflare-linux-amd64.tar.gz"
      sha256 "f82c5ee212f29c4ff14111e0024d4c21d375db8b0c08b92ae106a6e3483019f9"
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
    assert_match "0.1.0", shell_output("#{bin}/agent-cloudflare --version")
    assert_match "agent-cloudflare usage", shell_output("#{bin}/agent-cloudflare usage")
    assert_match "#compdef agent-cloudflare", shell_output("#{bin}/agent-cloudflare completion zsh")
    assert_match "bash completion", shell_output("#{bin}/agent-cloudflare completion bash")
  end
end
