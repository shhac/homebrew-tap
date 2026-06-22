class AgentStripe < Formula
  desc "Stripe incident triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-stripe"
  version "0.14.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.14.0/agent-stripe-darwin-arm64.tar.gz"
      sha256 "00c94aeb64d896eb063875510d69760ced898878758683f0d035d349708c6195"
    end
    on_intel do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.14.0/agent-stripe-darwin-amd64.tar.gz"
      sha256 "482080c2b91425e47096865d71984c1b7bb6baa5da93a395fcc6376b324c2677"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.14.0/agent-stripe-linux-arm64.tar.gz"
      sha256 "a5cc6f0263b80059f4b8846ee68c603f2ec734414b2e88e8a0282623c065a35d"
    end
    on_intel do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.14.0/agent-stripe-linux-amd64.tar.gz"
      sha256 "8dc6aff090c0e47f098080d42085e04478e371a61834288d6fc07bdb432aa832"
    end
  end

  def install
    bin.install "agent-stripe"
    # Installs shell completions via `agent-stripe completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-stripe", "completion")
  end

  test do
    assert_match "0.14.0", shell_output("#{bin}/agent-stripe --version")
    assert_match "Stripe incident triage CLI", shell_output("#{bin}/agent-stripe --help")
    assert_match "#compdef agent-stripe", shell_output("#{bin}/agent-stripe completion zsh")
  end
end
