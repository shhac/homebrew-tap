class AgentVercel < Formula
  desc "Vercel CLI for AI agents"
  homepage "https://github.com/shhac/agent-vercel"
  version "0.14.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.14.0/agent-vercel-darwin-arm64.tar.gz"
      sha256 "5e269b2d944376b020a9ba920c8fc21aa71724b3f1a27c8c923117ca2f64b004"
    end
    on_intel do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.14.0/agent-vercel-darwin-amd64.tar.gz"
      sha256 "622720898834cf759c8c25f4cbc159752a57b30db8df04ff93a5494842804584"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.14.0/agent-vercel-linux-arm64.tar.gz"
      sha256 "7a1e8fa61d0f337bd04c9c14ae995dbc477d5343f6501502b10ad1d3d18f977c"
    end
    on_intel do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.14.0/agent-vercel-linux-amd64.tar.gz"
      sha256 "5928fcd980eb78729aca788de277d09b09a845055d66e82cc41aec3897e9e558"
    end
  end

  def install
    bin.install "agent-vercel"
    # Installs shell completions via `agent-vercel completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-vercel", "completion")
  end

  test do
    assert_match "0.14.0", shell_output("#{bin}/agent-vercel --version")
    assert_match "Vercel CLI for AI agents", shell_output("#{bin}/agent-vercel --help")
    assert_match "#compdef agent-vercel", shell_output("#{bin}/agent-vercel completion zsh")
  end
end
