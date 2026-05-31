class AgentStripe < Formula
  desc "Stripe incident triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-stripe"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.3.0/agent-stripe-darwin-arm64.tar.gz"
      sha256 "12a6797366176f099cc82dbbf981c4af7486f5f75aaf3a54362869bf4056866f"
    end
    on_intel do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.3.0/agent-stripe-darwin-amd64.tar.gz"
      sha256 "7df57f3828a7617ac6901a22d0a3c8ee5d8601e671418410746fbcf8bef0db59"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.3.0/agent-stripe-linux-arm64.tar.gz"
      sha256 "fd8dbecb487445758c05e66750d67c43d0f3723394fa57b2c5a58cfa0146d09c"
    end
    on_intel do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.3.0/agent-stripe-linux-amd64.tar.gz"
      sha256 "d2a79b41f5add0179a45061674bdd5a3786b6a4f88e568b1352c6f6c98c2fc70"
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
    assert_match "0.3.0", shell_output("#{bin}/agent-stripe --version")
    assert_match "Stripe incident triage CLI", shell_output("#{bin}/agent-stripe --help")
    # Completion subcommand must produce something for each supported shell.
    assert_match "#compdef agent-stripe", shell_output("#{bin}/agent-stripe completion zsh")
    assert_match "bash completion", shell_output("#{bin}/agent-stripe completion bash")
  end
end
