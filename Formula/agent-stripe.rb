class AgentStripe < Formula
  desc "Stripe incident triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-stripe"
  version "0.17.1"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.17.1/agent-stripe-darwin-arm64.tar.gz"
      sha256 "6347250290c8efee2df7728b2aa5aa005e484c05ed6dbcbc8d69e322b21e8489"
    end
    on_intel do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.17.1/agent-stripe-darwin-amd64.tar.gz"
      sha256 "3722beaba380985ab0dc779ad5fca9ae845a7edb0fae5550339e97812b83b8b6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.17.1/agent-stripe-linux-arm64.tar.gz"
      sha256 "6773672c2e68fa945ae194fe42c31960ab1b5ae1952060f6d6baa264fa7af4a9"
    end
    on_intel do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.17.1/agent-stripe-linux-amd64.tar.gz"
      sha256 "16908ceff09247e498eda21f704cafea85b6678d9ddd6377c5f9f55764ba1a19"
    end
  end

  def install
    bin.install "agent-stripe"
    # Installs shell completions via `agent-stripe completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-stripe", "completion")
  end

  test do
    assert_match "0.17.1", shell_output("#{bin}/agent-stripe --version")
    assert_match "Stripe incident triage CLI", shell_output("#{bin}/agent-stripe --help")
    assert_match "#compdef agent-stripe", shell_output("#{bin}/agent-stripe completion zsh")
  end
end
