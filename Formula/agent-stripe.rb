class AgentStripe < Formula
  desc "Stripe incident triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-stripe"
  version "0.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.11.0/agent-stripe-darwin-arm64.tar.gz"
      sha256 "8b8776b85d2dc38f41ff86dd1466a833512f62f3534549a4836ae89cf1b16a19"
    end
    on_intel do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.11.0/agent-stripe-darwin-amd64.tar.gz"
      sha256 "f653224c6c4c15bb15fb9d8223c280814cde4ace6edcbce4fb909665b8276147"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.11.0/agent-stripe-linux-arm64.tar.gz"
      sha256 "386250d0e9f9bad77723d059e7755d7249a6bac66938acdd621848f3d2fa96e5"
    end
    on_intel do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.11.0/agent-stripe-linux-amd64.tar.gz"
      sha256 "d4aafccf48e02ae430e949037a9884140ddc17081f0ee3cc2e0704a6e008622d"
    end
  end

  def install
    bin.install "agent-stripe"
    # Installs shell completions via `agent-stripe completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-stripe", "completion")
  end

  test do
    assert_match "0.11.0", shell_output("#{bin}/agent-stripe --version")
    assert_match "Stripe incident triage CLI", shell_output("#{bin}/agent-stripe --help")
    assert_match "#compdef agent-stripe", shell_output("#{bin}/agent-stripe completion zsh")
  end
end
