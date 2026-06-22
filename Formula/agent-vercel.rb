class AgentVercel < Formula
  desc "Vercel CLI for AI agents"
  homepage "https://github.com/shhac/agent-vercel"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.8.0/agent-vercel-darwin-arm64.tar.gz"
      sha256 "289821b2231264bafa5d4bdeedfa394a99512380e15d13a0c11947e297fa94fa"
    end
    on_intel do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.8.0/agent-vercel-darwin-amd64.tar.gz"
      sha256 "c207e375a350fa57e27f944dfa99777c3a1ebcaad35282e40baf2648a47d3172"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.8.0/agent-vercel-linux-arm64.tar.gz"
      sha256 "c73e375c0f1f1514c1b53d2d512360f013f723df4c884b619cff7cfa3d308c9d"
    end
    on_intel do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.8.0/agent-vercel-linux-amd64.tar.gz"
      sha256 "0dfe08f491312f11a48a44150911de6e10da39637d5ac13ee1bab23ac0773400"
    end
  end

  def install
    bin.install "agent-vercel"
    # Installs shell completions via `agent-vercel completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-vercel", "completion")
  end

  test do
    assert_match "0.8.0", shell_output("#{bin}/agent-vercel --version")
    assert_match "Vercel CLI for AI agents", shell_output("#{bin}/agent-vercel --help")
    assert_match "#compdef agent-vercel", shell_output("#{bin}/agent-vercel completion zsh")
  end
end
