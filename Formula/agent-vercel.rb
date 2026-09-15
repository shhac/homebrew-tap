class AgentVercel < Formula
  desc "Vercel CLI for AI agents"
  homepage "https://github.com/shhac/agent-vercel"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.16.0/agent-vercel-darwin-arm64.tar.gz"
      sha256 "47b30444f68fed70a6efe6bc59d6f0ff738bb210661db25d43fe986925298066"
    end
    on_intel do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.16.0/agent-vercel-darwin-amd64.tar.gz"
      sha256 "173d4cfb69d0ca176332ca91855385defd286de00ca338174df814b827f34876"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.16.0/agent-vercel-linux-arm64.tar.gz"
      sha256 "25fdda1ab619108f7b310bae489fdafcc25c9504a1aa025bfa2314c6789885ee"
    end
    on_intel do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.16.0/agent-vercel-linux-amd64.tar.gz"
      sha256 "23599fb98747660731761f43354361d44f6b14d8ae16d8ceb3ca37a5476f1932"
    end
  end

  def install
    bin.install "agent-vercel"
    # Installs shell completions via `agent-vercel completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-vercel", "completion")
  end

  test do
    assert_match "0.16.0", shell_output("#{bin}/agent-vercel --version")
    assert_match "Vercel CLI", shell_output("#{bin}/agent-vercel --help")
    assert_match "#compdef agent-vercel", shell_output("#{bin}/agent-vercel completion zsh")
  end
end
