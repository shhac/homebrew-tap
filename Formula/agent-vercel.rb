class AgentVercel < Formula
  desc "Vercel CLI for AI agents"
  homepage "https://github.com/shhac/agent-vercel"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.1.1/agent-vercel-darwin-arm64.tar.gz"
      sha256 "cc5b7738f205ee91ce750a0f61fea9fff88c4bf288cb23e3e5c36a2af9f2b60a"
    end
    on_intel do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.1.1/agent-vercel-darwin-amd64.tar.gz"
      sha256 "62de42cc8c768f9d759a568a4a2e82d6f490f9bef41c606574642f335eb96d2c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.1.1/agent-vercel-linux-arm64.tar.gz"
      sha256 "9f973cf015a4d93a94653c0466fecfe2299bc3f6234c7ec7bba3ee4e24cb9a29"
    end
    on_intel do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.1.1/agent-vercel-linux-amd64.tar.gz"
      sha256 "77224e8b3a84509d98a6250b43ed67e99f43c22b735f0b3470e53e2fa34d1fbc"
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
    assert_match "0.1.1", shell_output("#{bin}/agent-vercel --version")
    assert_match "agent-vercel", shell_output("#{bin}/agent-vercel usage")
    assert_match "#compdef agent-vercel", shell_output("#{bin}/agent-vercel completion zsh")
    assert_match "bash completion", shell_output("#{bin}/agent-vercel completion bash")
  end
end
