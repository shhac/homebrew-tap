class AgentVercel < Formula
  desc "Vercel CLI for AI agents"
  homepage "https://github.com/shhac/agent-vercel"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.4.0/agent-vercel-darwin-arm64.tar.gz"
      sha256 "eadf722663513df997f0d0d5db45139ba26213a36633a46a99909b2018f6d6dc"
    end
    on_intel do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.4.0/agent-vercel-darwin-amd64.tar.gz"
      sha256 "b4c8932c0a9c8a7d8abf0fe264050bff86fe90e48a1c01857ee8702d887efe8b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.4.0/agent-vercel-linux-arm64.tar.gz"
      sha256 "ddbef045618a8421cccfd5a88d0e840124beaa6facd4d37d16f5b5212cf2e04c"
    end
    on_intel do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.4.0/agent-vercel-linux-amd64.tar.gz"
      sha256 "539a6a02c14770423dd4f410bfc5b77a2f18a00473eec8b341fefc489e5ae9cb"
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
    assert_match "0.4.0", shell_output("#{bin}/agent-vercel --version")
    assert_match "agent-vercel", shell_output("#{bin}/agent-vercel usage")
    assert_match "#compdef agent-vercel", shell_output("#{bin}/agent-vercel completion zsh")
    assert_match "bash completion", shell_output("#{bin}/agent-vercel completion bash")
  end
end
