class AgentVercel < Formula
  desc "Vercel CLI for AI agents"
  homepage "https://github.com/shhac/agent-vercel"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.9.0/agent-vercel-darwin-arm64.tar.gz"
      sha256 "be9de20d3fcc8e0e8bf13afc50e047e4af795d68d703bbe8c688daa298b8815e"
    end
    on_intel do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.9.0/agent-vercel-darwin-amd64.tar.gz"
      sha256 "c976b3cc606fbf6860110adcf674607c7511005bd23783f95e254c8fbbae39d1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.9.0/agent-vercel-linux-arm64.tar.gz"
      sha256 "5bb6821610ebebae10baedb38e44c1de622100a11e050c2bb29dbb1445af195e"
    end
    on_intel do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.9.0/agent-vercel-linux-amd64.tar.gz"
      sha256 "76c17924e824caefa6cea8b0d18f95422e98d07df2cd919c96c89dd15fae0387"
    end
  end

  def install
    bin.install "agent-vercel"
    # Installs shell completions via `agent-vercel completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-vercel", "completion")
  end

  test do
    assert_match "0.9.0", shell_output("#{bin}/agent-vercel --version")
    assert_match "Vercel CLI for AI agents", shell_output("#{bin}/agent-vercel --help")
    assert_match "#compdef agent-vercel", shell_output("#{bin}/agent-vercel completion zsh")
  end
end
