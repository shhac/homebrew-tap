class AgentVercel < Formula
  desc "Vercel CLI for AI agents"
  homepage "https://github.com/shhac/agent-vercel"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.3.0/agent-vercel-darwin-arm64.tar.gz"
      sha256 "8fb2fd42581973508711793f562489f3ec7d57b98e1b39d339da8ce2bb71dffb"
    end
    on_intel do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.3.0/agent-vercel-darwin-amd64.tar.gz"
      sha256 "947ec492dd9a583069941da6bd21f88db7146179d536a19dcda1bd149293c6be"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.3.0/agent-vercel-linux-arm64.tar.gz"
      sha256 "cfa49e3496f39da0792fcebfd05a8553b12cb8ec3c77d0a15a25a4bab5289309"
    end
    on_intel do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.3.0/agent-vercel-linux-amd64.tar.gz"
      sha256 "6a38d432474f866afb7e26d3690e929413f3908928cad6236ea8c89cebcb1a63"
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
    assert_match "0.3.0", shell_output("#{bin}/agent-vercel --version")
    assert_match "agent-vercel", shell_output("#{bin}/agent-vercel usage")
    assert_match "#compdef agent-vercel", shell_output("#{bin}/agent-vercel completion zsh")
    assert_match "bash completion", shell_output("#{bin}/agent-vercel completion bash")
  end
end
