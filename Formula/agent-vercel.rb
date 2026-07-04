class AgentVercel < Formula
  desc "Vercel CLI for AI agents"
  homepage "https://github.com/shhac/agent-vercel"
  version "0.15.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.15.0/agent-vercel-darwin-arm64.tar.gz"
      sha256 "368c0d3f85fc3608e7bac7d87c0ec47837b6ed1aeb1c34051bc258e22388e737"
    end
    on_intel do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.15.0/agent-vercel-darwin-amd64.tar.gz"
      sha256 "a6c4f5c75b5e1315270b97e334b0a4df11a9464fd2ec7ba5c791d51d36feebbb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.15.0/agent-vercel-linux-arm64.tar.gz"
      sha256 "dc80db50551d05be8519d079f85452d373cc4a4ce15d5101ff704c2c104881ee"
    end
    on_intel do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.15.0/agent-vercel-linux-amd64.tar.gz"
      sha256 "231cd3dff7cd6d49f9c70704baebab76de1fb062b9a7f7e526f717959f37d1c4"
    end
  end

  def install
    bin.install "agent-vercel"
    # Installs shell completions via `agent-vercel completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-vercel", "completion")
  end

  test do
    assert_match "0.15.0", shell_output("#{bin}/agent-vercel --version")
    assert_match "Vercel CLI for AI agents", shell_output("#{bin}/agent-vercel --help")
    assert_match "#compdef agent-vercel", shell_output("#{bin}/agent-vercel completion zsh")
  end
end
