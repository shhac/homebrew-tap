class AgentStripe < Formula
  desc "Stripe incident triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-stripe"
  version "0.17.2"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.17.2/agent-stripe-darwin-arm64.tar.gz"
      sha256 "14e5a993e6827b3febf59d978d5101d67a00d863e46127f4bb4ab2e2b5aeedad"
    end
    on_intel do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.17.2/agent-stripe-darwin-amd64.tar.gz"
      sha256 "45105bc24ee5a2e8998c5ae42e1e7448d08445500fdbbfaef59dfa3b66f0af38"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.17.2/agent-stripe-linux-arm64.tar.gz"
      sha256 "f708acdf0dde231ca3a7edfd1e39f153dcbafb033b3657d252ca76b4bec24d55"
    end
    on_intel do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.17.2/agent-stripe-linux-amd64.tar.gz"
      sha256 "250c86aad14de50d433a7c36d93290ff0999a754aecedd09bee6b2f3d8d41391"
    end
  end

  def install
    bin.install "agent-stripe"
    # Installs shell completions via `agent-stripe completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-stripe", "completion")
  end

  test do
    assert_match "0.17.2", shell_output("#{bin}/agent-stripe --version")
    assert_match "Stripe incident triage CLI", shell_output("#{bin}/agent-stripe --help")
    assert_match "#compdef agent-stripe", shell_output("#{bin}/agent-stripe completion zsh")
  end
end
