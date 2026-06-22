class AgentVercel < Formula
  desc "Vercel CLI for AI agents"
  homepage "https://github.com/shhac/agent-vercel"
  version "0.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.10.0/agent-vercel-darwin-arm64.tar.gz"
      sha256 "82c645f6b569c8fbb6a4285b93bc88f1e6463e3728cb0fc653e8921d3ba3aeaf"
    end
    on_intel do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.10.0/agent-vercel-darwin-amd64.tar.gz"
      sha256 "a054ede09cc8cca33d3d888ec91c390addbb0016deb5089a0d9a29a3a280c809"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.10.0/agent-vercel-linux-arm64.tar.gz"
      sha256 "f94dd6245e97245d5f3f725198fdbc9816fde707b0cff64529cd1a23e26a8707"
    end
    on_intel do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.10.0/agent-vercel-linux-amd64.tar.gz"
      sha256 "28b5c6e37da9bd1cd0690e3efe0816f27b6eeadb49a03dc1fedf2981895f97e2"
    end
  end

  def install
    bin.install "agent-vercel"
    # Installs shell completions via `agent-vercel completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-vercel", "completion")
  end

  test do
    assert_match "0.10.0", shell_output("#{bin}/agent-vercel --version")
    assert_match "Vercel CLI for AI agents", shell_output("#{bin}/agent-vercel --help")
    assert_match "#compdef agent-vercel", shell_output("#{bin}/agent-vercel completion zsh")
  end
end
