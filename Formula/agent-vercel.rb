class AgentVercel < Formula
  desc "Vercel CLI for AI agents"
  homepage "https://github.com/shhac/agent-vercel"
  version "0.16.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.16.0/agent-vercel-darwin-arm64.tar.gz"
      sha256 "c96ff543dec70000e2873d9fabbbcfe6140bc301518d9bd58fe94b66d80e8aa0"
    end
    on_intel do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.16.0/agent-vercel-darwin-amd64.tar.gz"
      sha256 "e9d11d795d12958c0cb07a452fed91a7f21d152e5718476e9b2363b578fcc6c0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.16.0/agent-vercel-linux-arm64.tar.gz"
      sha256 "a6d868cc9f8f3e4270ce3e3d4e31c82edea76b36583d0ef44ca23f98418c4a0a"
    end
    on_intel do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.16.0/agent-vercel-linux-amd64.tar.gz"
      sha256 "c3b7c4b53bb55474145bd880f2b2d57276a2f56857184ba6e72e91a85b0ed9ea"
    end
  end

  def install
    bin.install "agent-vercel"
    # Installs shell completions via `agent-vercel completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-vercel", "completion")
  end

  test do
    assert_match "0.16.0", shell_output("#{bin}/agent-vercel --version")
    assert_match "Vercel CLI for AI agents", shell_output("#{bin}/agent-vercel --help")
    assert_match "#compdef agent-vercel", shell_output("#{bin}/agent-vercel completion zsh")
  end
end
