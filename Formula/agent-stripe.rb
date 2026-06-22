class AgentStripe < Formula
  desc "Stripe incident triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-stripe"
  version "0.15.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.15.0/agent-stripe-darwin-arm64.tar.gz"
      sha256 "4a2c3acb9ad76e2afc7d0e574a0a2a7fced6244011d87a8a8005155bdb9c6680"
    end
    on_intel do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.15.0/agent-stripe-darwin-amd64.tar.gz"
      sha256 "078f1ed15e4b1c6706777e8d96cebfb65f255b03d617f0b61a2ad78f20c9fba6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.15.0/agent-stripe-linux-arm64.tar.gz"
      sha256 "8906196c156c28be9340fffd8c86e94dd0e7507b49096597b79ddb24c4d29682"
    end
    on_intel do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.15.0/agent-stripe-linux-amd64.tar.gz"
      sha256 "4468d039d5b2eb43420aeccc21c3325e704e97f051596b9774623c96b719abb9"
    end
  end

  def install
    bin.install "agent-stripe"
    # Installs shell completions via `agent-stripe completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-stripe", "completion")
  end

  test do
    assert_match "0.15.0", shell_output("#{bin}/agent-stripe --version")
    assert_match "Stripe incident triage CLI", shell_output("#{bin}/agent-stripe --help")
    assert_match "#compdef agent-stripe", shell_output("#{bin}/agent-stripe completion zsh")
  end
end
