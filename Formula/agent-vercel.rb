class AgentVercel < Formula
  desc "Vercel CLI for AI agents"
  homepage "https://github.com/shhac/agent-vercel"
  version "0.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.11.0/agent-vercel-darwin-arm64.tar.gz"
      sha256 "f18b7727336721f707041c1a043de6c5564238beaef1a799ac39900dbbd5ac8a"
    end
    on_intel do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.11.0/agent-vercel-darwin-amd64.tar.gz"
      sha256 "ead3bd425bb3ccaf22e72de957211dcf48b1c0a5f2a178dac357fdbdb6af63ff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.11.0/agent-vercel-linux-arm64.tar.gz"
      sha256 "83226990d812e15e110aa51eae0506d570980dd9d7afe8895bb085d914a6459a"
    end
    on_intel do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.11.0/agent-vercel-linux-amd64.tar.gz"
      sha256 "d36e33a29f96f1c9f0c266dd9202b80bfd22a76daa1b779394b1bdd08533ac5f"
    end
  end

  def install
    bin.install "agent-vercel"
    # Installs shell completions via `agent-vercel completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-vercel", "completion")
  end

  test do
    assert_match "0.11.0", shell_output("#{bin}/agent-vercel --version")
    assert_match "Vercel CLI for AI agents", shell_output("#{bin}/agent-vercel --help")
    assert_match "#compdef agent-vercel", shell_output("#{bin}/agent-vercel completion zsh")
  end
end
