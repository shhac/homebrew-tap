class AgentStripe < Formula
  desc "Stripe incident triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-stripe"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.1.0/agent-stripe-darwin-arm64.tar.gz"
      sha256 "6831ca598bd48c698d642f39ce3991c6e6a66b627aee7aa4d5c8c4a6b5de3a2a"
    end
    on_intel do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.1.0/agent-stripe-darwin-amd64.tar.gz"
      sha256 "ff989abd9bc0aec87a3545215ee2ae703e550fffdad77f3addc5636aadb67e97"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.1.0/agent-stripe-linux-arm64.tar.gz"
      sha256 "8b724c343c520e20189d3ddcdbb63fed0bc3a73705ee2e73aab0a6e1c5966a0d"
    end
    on_intel do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.1.0/agent-stripe-linux-amd64.tar.gz"
      sha256 "0cd1fa771c16906997844e92bf1c421c353580ea80bbc652fea66f1f95050b20"
    end
  end

  def install
    bin.install Dir["agent-stripe-*"].first => "agent-stripe"
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/agent-stripe --version")
    assert_match "Stripe incident triage CLI", shell_output("#{bin}/agent-stripe --help")
  end
end
