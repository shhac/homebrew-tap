class AgentStripe < Formula
  desc "Stripe incident triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-stripe"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.2.0/agent-stripe-darwin-arm64.tar.gz"
      sha256 "1a7ba354e84df2e1a7bb39b5fe3579df33d179a812ae1a5dcd4bb150e99ffc85"
    end
    on_intel do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.2.0/agent-stripe-darwin-amd64.tar.gz"
      sha256 "99557883520f286e1c8c1a6704038d2c3e4933a4951ff8d4aafb23bf89466ee3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.2.0/agent-stripe-linux-arm64.tar.gz"
      sha256 "ef71e591675865745b711fe8ef334a3b1d16e834b3bf0c09f10407059257e354"
    end
    on_intel do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.2.0/agent-stripe-linux-amd64.tar.gz"
      sha256 "874d72c684192428a145cee2446602b6cf79cc39391c5ae7bd5d01e82fc7d904"
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
    assert_match "0.2.0", shell_output("#{bin}/agent-stripe --version")
    assert_match "Stripe incident triage CLI", shell_output("#{bin}/agent-stripe --help")
    # Completion subcommand must produce something for each supported shell.
    assert_match "#compdef agent-stripe", shell_output("#{bin}/agent-stripe completion zsh")
    assert_match "bash completion", shell_output("#{bin}/agent-stripe completion bash")
  end
end
