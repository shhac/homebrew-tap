class AgentVercel < Formula
  desc "Vercel CLI for AI agents"
  homepage "https://github.com/shhac/agent-vercel"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.2.0/agent-vercel-darwin-arm64.tar.gz"
      sha256 "07e357f6ca7111837f28fbbe682fb98553246d5341f376ea7c2c23d637eb44f7"
    end
    on_intel do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.2.0/agent-vercel-darwin-amd64.tar.gz"
      sha256 "fec6a1ebe21bc0a6dd4d38c23d1d1a3bfe2c1ee2bb0ec0ff2a5948c29c6b8b45"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.2.0/agent-vercel-linux-arm64.tar.gz"
      sha256 "c134b992fdd4d8c49728aa75789fb069f58c1a68f69755d42cc26e387a296e0a"
    end
    on_intel do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.2.0/agent-vercel-linux-amd64.tar.gz"
      sha256 "c836001eefa80a2dbc7abb5c4c26db2b67ab0907a6c820d6dffc99769cd8c270"
    end
  end

  def install
    bin.install Dir["agent-vercel-*"].first => "agent-vercel"
    # Runs `agent-vercel completion bash|zsh|fish` and installs each to brew's
    # standard completion paths. zsh and fish pick them up via the
    # default brew shellenv; bash needs `brew install bash-completion@2`.
    generate_completions_from_executable(bin/"agent-vercel", "completion")
  end

  test do
    assert_match "0.2.0", shell_output("#{bin}/agent-vercel --version")
    assert_match "agent-vercel", shell_output("#{bin}/agent-vercel usage")
    assert_match "#compdef agent-vercel", shell_output("#{bin}/agent-vercel completion zsh")
    assert_match "bash completion", shell_output("#{bin}/agent-vercel completion bash")
  end
end
