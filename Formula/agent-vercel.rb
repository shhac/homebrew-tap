class AgentVercel < Formula
  desc "Vercel CLI for AI agents"
  homepage "https://github.com/shhac/agent-vercel"
  version "0.11.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.11.1/agent-vercel-darwin-arm64.tar.gz"
      sha256 "e08d10e74754b7861e07ae602a039e587cc7ef32c324bd90d2af71bf259595e1"
    end
    on_intel do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.11.1/agent-vercel-darwin-amd64.tar.gz"
      sha256 "fabc9820fa55bf67e711f7359c525eb3e3555520413466c95a1e576cca0eb8a7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.11.1/agent-vercel-linux-arm64.tar.gz"
      sha256 "e3f14989ed0a53351c609881391702d6f06af23d2bfaf518b93b87bc2f7adf9b"
    end
    on_intel do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.11.1/agent-vercel-linux-amd64.tar.gz"
      sha256 "c01c32fd5db3d94cd2ca649688ac5e4bc5d80b37e19ad80bd311919846b1b618"
    end
  end

  def install
    bin.install "agent-vercel"
    # Installs shell completions via `agent-vercel completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-vercel", "completion")
  end

  test do
    assert_match "0.11.1", shell_output("#{bin}/agent-vercel --version")
    assert_match "Vercel CLI for AI agents", shell_output("#{bin}/agent-vercel --help")
    assert_match "#compdef agent-vercel", shell_output("#{bin}/agent-vercel completion zsh")
  end
end
