class AgentStripe < Formula
  desc "Stripe incident triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-stripe"
  version "0.15.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.15.1/agent-stripe-darwin-arm64.tar.gz"
      sha256 "eed9cd30f4d919a817e3c9c589b621025a3077d8f95b27f927defd20aa7ed696"
    end
    on_intel do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.15.1/agent-stripe-darwin-amd64.tar.gz"
      sha256 "75fef9c842037e155d432eccf2f905ec5264ba16cdc9821e1a12e5cca154f369"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.15.1/agent-stripe-linux-arm64.tar.gz"
      sha256 "48693eb78892bea4a833fb138ba31a571326c603f20204e2396462bd807ddcfd"
    end
    on_intel do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.15.1/agent-stripe-linux-amd64.tar.gz"
      sha256 "f2a62390c59aceaed4a017a1c52be67e45872c29b7d2e1bce82098c90a177a0e"
    end
  end

  def install
    bin.install "agent-stripe"
    # Installs shell completions via `agent-stripe completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-stripe", "completion")
  end

  test do
    assert_match "0.15.1", shell_output("#{bin}/agent-stripe --version")
    assert_match "Stripe incident triage CLI", shell_output("#{bin}/agent-stripe --help")
    assert_match "#compdef agent-stripe", shell_output("#{bin}/agent-stripe completion zsh")
  end
end
