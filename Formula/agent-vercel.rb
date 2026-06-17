class AgentVercel < Formula
  desc "Vercel CLI for AI agents"
  homepage "https://github.com/shhac/agent-vercel"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.1.0/agent-vercel-darwin-arm64.tar.gz"
      sha256 "2e57647f649666170356ba3bdce975c5365c63b0a6904870b2debdd164275d45"
    end
    on_intel do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.1.0/agent-vercel-darwin-amd64.tar.gz"
      sha256 "feb3475fbd4bb6b1735d3921f2b8777747886796e79ae5f6964600716742d29e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.1.0/agent-vercel-linux-arm64.tar.gz"
      sha256 "afb5f3a7b6219d89ed0e5c533210ab7d40d5f194728dab64256ce1de744ee036"
    end
    on_intel do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.1.0/agent-vercel-linux-amd64.tar.gz"
      sha256 "94354e31789419e321ad2c0d040953092f188e6aa497dc69e9220bea98a80edc"
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
    assert_match "0.1.0", shell_output("#{bin}/agent-vercel --version")
    assert_match "agent-vercel", shell_output("#{bin}/agent-vercel usage")
    assert_match "#compdef agent-vercel", shell_output("#{bin}/agent-vercel completion zsh")
    assert_match "bash completion", shell_output("#{bin}/agent-vercel completion bash")
  end
end
