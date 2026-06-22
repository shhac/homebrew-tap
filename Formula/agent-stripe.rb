class AgentStripe < Formula
  desc "Stripe incident triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-stripe"
  version "0.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.10.0/agent-stripe-darwin-arm64.tar.gz"
      sha256 "4a637f1f73a0a54afbe4fbcce67a97b3f9123a4522d24c3ea4af37416cc4b925"
    end
    on_intel do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.10.0/agent-stripe-darwin-amd64.tar.gz"
      sha256 "e0c8f5b5f525daeab89bf4c0efd7ca0aaf1f93d0c7587ddf3fee52a231ed0923"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.10.0/agent-stripe-linux-arm64.tar.gz"
      sha256 "bcfda89edce3a19eb42d61b211d2d5e0b3505f64224f74a33764e3353e8e98c7"
    end
    on_intel do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.10.0/agent-stripe-linux-amd64.tar.gz"
      sha256 "7aab2d87e0a430ad083f68fba3d028a12d1ae1d9ffbda6ebd183f42ab7a0e4d0"
    end
  end

  def install
    bin.install "agent-stripe"
    # Installs shell completions via `agent-stripe completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-stripe", "completion")
  end

  test do
    assert_match "0.10.0", shell_output("#{bin}/agent-stripe --version")
    assert_match "Stripe incident triage CLI", shell_output("#{bin}/agent-stripe --help")
    assert_match "#compdef agent-stripe", shell_output("#{bin}/agent-stripe completion zsh")
  end
end
