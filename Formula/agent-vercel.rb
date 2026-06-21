class AgentVercel < Formula
  desc "Vercel CLI for AI agents"
  homepage "https://github.com/shhac/agent-vercel"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.5.0/agent-vercel-darwin-arm64.tar.gz"
      sha256 "4cf84d15738f5478a1bbb710926f14ca5b4161012d3eb801e3e7884fad6981d7"
    end
    on_intel do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.5.0/agent-vercel-darwin-amd64.tar.gz"
      sha256 "fe24bcddef101067a6bd9f82ecd75fef189bc2839cfa88bef7da2cd8028739f0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.5.0/agent-vercel-linux-arm64.tar.gz"
      sha256 "d110a606f10ea8da762eb0cd5587ff50b8d1358cac294214d51df407a7be2e70"
    end
    on_intel do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.5.0/agent-vercel-linux-amd64.tar.gz"
      sha256 "b60b082bbdeab27962a323919a2a04d724662c79d7d1c2f4717d853553482b6c"
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
    assert_match "0.5.0", shell_output("#{bin}/agent-vercel --version")
    assert_match "agent-vercel", shell_output("#{bin}/agent-vercel usage")
    assert_match "#compdef agent-vercel", shell_output("#{bin}/agent-vercel completion zsh")
    assert_match "bash completion", shell_output("#{bin}/agent-vercel completion bash")
  end
end
