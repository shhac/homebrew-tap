class AgentVercel < Formula
  desc "Vercel CLI for AI agents"
  homepage "https://github.com/shhac/agent-vercel"
  version "0.13.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.13.1/agent-vercel-darwin-arm64.tar.gz"
      sha256 "f2475070a9629ddd4f4ad57c6c03a45d6195b142522cae3c800b67ba4194bc8c"
    end
    on_intel do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.13.1/agent-vercel-darwin-amd64.tar.gz"
      sha256 "4ded680d8c106f0daf57d4b48d2ed51491b20c23dbdb52b5c1890adbc7100adc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.13.1/agent-vercel-linux-arm64.tar.gz"
      sha256 "02483a9ffdfc83ec8c3b4af4bd533898639f9ade36ddb7a87acf07284c9db7f5"
    end
    on_intel do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.13.1/agent-vercel-linux-amd64.tar.gz"
      sha256 "e1b289360bbcba17ce6eb3fc42bc95bdb444ae67d8fed3745489c7ce2a20d4c5"
    end
  end

  def install
    bin.install "agent-vercel"
    # Installs shell completions via `agent-vercel completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-vercel", "completion")
  end

  test do
    assert_match "0.13.1", shell_output("#{bin}/agent-vercel --version")
    assert_match "Vercel CLI for AI agents", shell_output("#{bin}/agent-vercel --help")
    assert_match "#compdef agent-vercel", shell_output("#{bin}/agent-vercel completion zsh")
  end
end
