class AgentStripe < Formula
  desc "Stripe incident triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-stripe"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.6.0/agent-stripe-darwin-arm64.tar.gz"
      sha256 "01c3904a79bc0606f3b97626a03862eada0d7ebb3b5cc910ed6a6840fa0d3fff"
    end
    on_intel do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.6.0/agent-stripe-darwin-amd64.tar.gz"
      sha256 "9c2769c9b02a96c3b705a8afd3ad643e9331de592bcf0f1d9bbd4a56b8e874d3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.6.0/agent-stripe-linux-arm64.tar.gz"
      sha256 "87cb2ad316a5c19838e50ec7851cce66ccd00cea5d57fbef163cae05628ea3de"
    end
    on_intel do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.6.0/agent-stripe-linux-amd64.tar.gz"
      sha256 "5e26f7724b2ffa535d20d81cc7cfd9d4ef6b0d07701a79b4f603c9d09e84474a"
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
    assert_match "0.6.0", shell_output("#{bin}/agent-stripe --version")
    assert_match "Stripe incident triage CLI", shell_output("#{bin}/agent-stripe --help")
    # Completion subcommand must produce something for each supported shell.
    assert_match "#compdef agent-stripe", shell_output("#{bin}/agent-stripe completion zsh")
    assert_match "bash completion", shell_output("#{bin}/agent-stripe completion bash")
  end
end
