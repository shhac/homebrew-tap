class AgentStripe < Formula
  desc "Stripe incident triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-stripe"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.4.0/agent-stripe-darwin-arm64.tar.gz"
      sha256 "da5cc9af47afbb67e132707520de386c46b83c1db1340b6a70d173f3f96409aa"
    end
    on_intel do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.4.0/agent-stripe-darwin-amd64.tar.gz"
      sha256 "5cfee82a531b1c392bc0ff451393e0d1a59088d5ddeaba5805751da9fcd60f79"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.4.0/agent-stripe-linux-arm64.tar.gz"
      sha256 "89f1f2a2a5b00598477c05c3e94dfd6dce82fb07d914cd60953face287ef4af6"
    end
    on_intel do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.4.0/agent-stripe-linux-amd64.tar.gz"
      sha256 "e63c7da33f01ef1f9b8c33afef9c882118695846916390291764396368749299"
    end
  end

  def install
    bin.install Dir["agent-stripe-*"].first => "agent-stripe"
    # Runs `agent-stripe completion bash|zsh|fish` and installs each to brew's
    # standard completion paths. zsh and fish pick them up via the
    # default brew shellenv; bash needs `brew install bash-completion@2`.
    generate_completions_from_executable(bin/"agent-stripe", "completion")
  end

  test do
    assert_match "0.4.0", shell_output("#{bin}/agent-stripe --version")
    assert_match "Stripe incident triage CLI", shell_output("#{bin}/agent-stripe --help")
    # Completion subcommand must produce something for each supported shell.
    assert_match "#compdef agent-stripe", shell_output("#{bin}/agent-stripe completion zsh")
    assert_match "bash completion", shell_output("#{bin}/agent-stripe completion bash")
  end
end
