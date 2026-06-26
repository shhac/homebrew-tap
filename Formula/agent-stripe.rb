class AgentStripe < Formula
  desc "Stripe incident triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-stripe"
  version "0.16.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.16.0/agent-stripe-darwin-arm64.tar.gz"
      sha256 "3f55a30fa7ccc472d5f00ae86ab3c0a2bfdfb70f4ffce36379756da048ffd22e"
    end
    on_intel do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.16.0/agent-stripe-darwin-amd64.tar.gz"
      sha256 "c5f48b7bac26c2305f7821b3b2ff1c8c3d8414ab530ca5a967ce61eca1931f0d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.16.0/agent-stripe-linux-arm64.tar.gz"
      sha256 "8971572de118b9c3c87f11a068beab44c1f2627bc62925e90aa692742e89dcda"
    end
    on_intel do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.16.0/agent-stripe-linux-amd64.tar.gz"
      sha256 "ffe3f19ab52527a56aff6f98bcfb81983517384f1ca3a27ed3255e4d6251b747"
    end
  end

  def install
    bin.install "agent-stripe"
    # Installs shell completions via `agent-stripe completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-stripe", "completion")
  end

  test do
    assert_match "0.16.0", shell_output("#{bin}/agent-stripe --version")
    assert_match "Stripe incident triage CLI", shell_output("#{bin}/agent-stripe --help")
    assert_match "#compdef agent-stripe", shell_output("#{bin}/agent-stripe completion zsh")
  end
end
