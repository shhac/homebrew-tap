class AgentVercel < Formula
  desc "Vercel CLI for AI agents"
  homepage "https://github.com/shhac/agent-vercel"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.6.0/agent-vercel-darwin-arm64.tar.gz"
      sha256 "5bc49df5ca872ae96b87e4844cecd0e16c02c5d0f9788c81b0448d676fdac635"
    end
    on_intel do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.6.0/agent-vercel-darwin-amd64.tar.gz"
      sha256 "0694d7d14f2bb6bf1af5416ba4133a023e4ad2eaea124cc4130be9a10f1f90c9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.6.0/agent-vercel-linux-arm64.tar.gz"
      sha256 "8ae4d80ce9f3bc4c4bae31be833f5f38c494defbdd2ac8670595845e975f7731"
    end
    on_intel do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.6.0/agent-vercel-linux-amd64.tar.gz"
      sha256 "a4d8a3d891a8eb67d80688a3437a677963a6f339ce9fa209865de06b4332985d"
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
    assert_match "0.6.0", shell_output("#{bin}/agent-vercel --version")
    assert_match "agent-vercel", shell_output("#{bin}/agent-vercel usage")
    assert_match "#compdef agent-vercel", shell_output("#{bin}/agent-vercel completion zsh")
    assert_match "bash completion", shell_output("#{bin}/agent-vercel completion bash")
  end
end
