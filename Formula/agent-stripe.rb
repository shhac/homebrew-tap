class AgentStripe < Formula
  desc "Stripe incident triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-stripe"
  version "0.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.12.0/agent-stripe-darwin-arm64.tar.gz"
      sha256 "d0b781f6f83a989cc1c54e2aef29ccead7a8245722460dd637ee7c64401d804b"
    end
    on_intel do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.12.0/agent-stripe-darwin-amd64.tar.gz"
      sha256 "56357595f4db1b1ecbf04a5eb19c06c0e2008f34c8c0473310e81c01f5f0f496"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.12.0/agent-stripe-linux-arm64.tar.gz"
      sha256 "0eae2de3eb3f2875a38e5e785572a7288fad8331bfafbe86aac75378e51e536a"
    end
    on_intel do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.12.0/agent-stripe-linux-amd64.tar.gz"
      sha256 "a65875b079ed92702b1e8724162e543fc70a2dc757f878d34845e2d95bbe778b"
    end
  end

  def install
    bin.install "agent-stripe"
    # Installs shell completions via `agent-stripe completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-stripe", "completion")
  end

  test do
    assert_match "0.12.0", shell_output("#{bin}/agent-stripe --version")
    assert_match "Stripe incident triage CLI", shell_output("#{bin}/agent-stripe --help")
    assert_match "#compdef agent-stripe", shell_output("#{bin}/agent-stripe completion zsh")
  end
end
