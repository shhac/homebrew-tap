class AgentStripe < Formula
  desc "Stripe incident triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-stripe"
  version "0.16.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.16.1/agent-stripe-darwin-arm64.tar.gz"
      sha256 "bbc4eb16ebd9cd4afc17410e0577eb1299ef0b967057650ef3327af195bcfbc3"
    end
    on_intel do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.16.1/agent-stripe-darwin-amd64.tar.gz"
      sha256 "6b1575ddb8e372b173abf60007a8dbbcb15501565c8b086aceb19f401bd5e70c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.16.1/agent-stripe-linux-arm64.tar.gz"
      sha256 "a38fefd2267578033eaedaf0ec8a9f20a59300df05ab0cde8c9e5d14cdaf6919"
    end
    on_intel do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.16.1/agent-stripe-linux-amd64.tar.gz"
      sha256 "34ded2d79250ce7170ca81eb609e1d207023205935beef65345e71231feaf55f"
    end
  end

  def install
    bin.install "agent-stripe"
    # Installs shell completions via `agent-stripe completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-stripe", "completion")
  end

  test do
    assert_match "0.16.1", shell_output("#{bin}/agent-stripe --version")
    assert_match "Stripe incident triage CLI", shell_output("#{bin}/agent-stripe --help")
    assert_match "#compdef agent-stripe", shell_output("#{bin}/agent-stripe completion zsh")
  end
end
