class AgentVercel < Formula
  desc "Vercel CLI for AI agents"
  homepage "https://github.com/shhac/agent-vercel"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.3.1/agent-vercel-darwin-arm64.tar.gz"
      sha256 "a87286a5acc58c39eae750a98f5bf8f8071d070fc6e267c70af6e440a16d0930"
    end
    on_intel do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.3.1/agent-vercel-darwin-amd64.tar.gz"
      sha256 "174555093cef2af08de03783200e5c177c70dace9801ab4e9164a6d37fea0560"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.3.1/agent-vercel-linux-arm64.tar.gz"
      sha256 "24c3670cbbc03e12d1fe0a457c3b1edf6953a309a4f697ce3144b62b4b82b495"
    end
    on_intel do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.3.1/agent-vercel-linux-amd64.tar.gz"
      sha256 "50beab163858902ed6a641bae7e90239174653cd1c977317b54dad758b7b659e"
    end
  end

  def install
    bin.install Dir["agent-vercel-*"].first => "agent-vercel"
    # Runs `agent-vercel completion bash|zsh|fish` and installs each to brew's
    # standard completion paths. zsh and fish pick them up via the
    # default brew shellenv; bash needs `brew install bash-completion@2`.
    generate_completions_from_executable(bin/"agent-vercel", "completion")
  end

  test do
    assert_match "0.3.1", shell_output("#{bin}/agent-vercel --version")
    assert_match "agent-vercel", shell_output("#{bin}/agent-vercel usage")
    assert_match "#compdef agent-vercel", shell_output("#{bin}/agent-vercel completion zsh")
    assert_match "bash completion", shell_output("#{bin}/agent-vercel completion bash")
  end
end
