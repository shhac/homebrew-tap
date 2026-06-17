class AgentVercel < Formula
  desc "Vercel CLI for AI agents"
  homepage "https://github.com/shhac/agent-vercel"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.1.2/agent-vercel-darwin-arm64.tar.gz"
      sha256 "ff2fe070e84bdedf11d6c1db59264e5cf43eb70957db3b3440e61b7a6c871651"
    end
    on_intel do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.1.2/agent-vercel-darwin-amd64.tar.gz"
      sha256 "95dff0112241346893800d8f9f9cbd949ce83513049f561d4198e3bc58624542"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.1.2/agent-vercel-linux-arm64.tar.gz"
      sha256 "004eedd8c4c89eb5006fbe9d71eb0cc8b650eeacf8a590747faa4cd8c064de79"
    end
    on_intel do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.1.2/agent-vercel-linux-amd64.tar.gz"
      sha256 "e5d7840ff565b37e370f8ca12340ef0e3f4cfc761ffe71fd675725a3d2a0487a"
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
    assert_match "0.1.2", shell_output("#{bin}/agent-vercel --version")
    assert_match "agent-vercel", shell_output("#{bin}/agent-vercel usage")
    assert_match "#compdef agent-vercel", shell_output("#{bin}/agent-vercel completion zsh")
    assert_match "bash completion", shell_output("#{bin}/agent-vercel completion bash")
  end
end
