class AgentVercel < Formula
  desc "Vercel CLI for AI agents"
  homepage "https://github.com/shhac/agent-vercel"
  version "0.15.1"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.15.1/agent-vercel-darwin-arm64.tar.gz"
      sha256 "a6bd0fa11b8483c783ef65d1014908b8569953f69678a83c04850484b4d329ca"
    end
    on_intel do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.15.1/agent-vercel-darwin-amd64.tar.gz"
      sha256 "8b29b46530fbdfa7f8d351b1303526f07d01f8bb04b95957fc64f8942fec12e3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.15.1/agent-vercel-linux-arm64.tar.gz"
      sha256 "a3c25d40fcb461dc6bd47cc3efc6e7b79cd298b51902112e5cf96341d2badd4d"
    end
    on_intel do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.15.1/agent-vercel-linux-amd64.tar.gz"
      sha256 "608a49b21cf90632b557f89b85dd583e974d7836b2acc634dbc8d845b8f4bd08"
    end
  end

  def install
    bin.install "agent-vercel"
    # Installs shell completions via `agent-vercel completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-vercel", "completion")
  end

  test do
    assert_match "0.15.1", shell_output("#{bin}/agent-vercel --version")
    assert_match "Vercel CLI for AI agents", shell_output("#{bin}/agent-vercel --help")
    assert_match "#compdef agent-vercel", shell_output("#{bin}/agent-vercel completion zsh")
  end
end
