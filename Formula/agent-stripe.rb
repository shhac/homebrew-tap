class AgentStripe < Formula
  desc "Stripe incident triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-stripe"
  version "0.18.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.18.0/agent-stripe-darwin-arm64.tar.gz"
      sha256 "6093f0449d66f74e63f3072ba4ff59d0dbbdc4de7a244838c122b11820662994"
    end
    on_intel do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.18.0/agent-stripe-darwin-amd64.tar.gz"
      sha256 "a6beee1dd0d848f66166af9f1461e2a7387ab8bec5e5a7721478334735f33ff2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.18.0/agent-stripe-linux-arm64.tar.gz"
      sha256 "067c862a49337d7e23c535846caec6b9caff87b71ac3b4f3d5f6efeb63d5d399"
    end
    on_intel do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.18.0/agent-stripe-linux-amd64.tar.gz"
      sha256 "262d76fd039b3bf889d6cbd37cff065abbb31bf18d412a62d5a4b1e83a1b5d89"
    end
  end

  def install
    bin.install "agent-stripe"
    # Installs shell completions via `agent-stripe completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-stripe", "completion")
  end

  test do
    assert_match "0.18.0", shell_output("#{bin}/agent-stripe --version")
    assert_match "Stripe incident triage CLI", shell_output("#{bin}/agent-stripe --help")
    assert_match "#compdef agent-stripe", shell_output("#{bin}/agent-stripe completion zsh")
  end
end
