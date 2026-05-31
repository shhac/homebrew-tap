class AgentStripe < Formula
  desc "Stripe incident triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-stripe"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.5.0/agent-stripe-darwin-arm64.tar.gz"
      sha256 "c382b6da87e45759b7429622395415c0d0831281ace6625f1bd995777708cbd0"
    end
    on_intel do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.5.0/agent-stripe-darwin-amd64.tar.gz"
      sha256 "3f15fcbb3469ddf4111ddc43c927a5fdf007e8d4c273c9dd05e398b88c8d5aa6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.5.0/agent-stripe-linux-arm64.tar.gz"
      sha256 "b52f9265f0939233b1f157d8de7138eda884f53a60bee85b327e034b198d9691"
    end
    on_intel do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.5.0/agent-stripe-linux-amd64.tar.gz"
      sha256 "0029fe15e2bffef7d89538b336e2a16bbfa5f6e83e989cbb27cbac0143a0935a"
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
    assert_match "0.5.0", shell_output("#{bin}/agent-stripe --version")
    assert_match "Stripe incident triage CLI", shell_output("#{bin}/agent-stripe --help")
    # Completion subcommand must produce something for each supported shell.
    assert_match "#compdef agent-stripe", shell_output("#{bin}/agent-stripe completion zsh")
    assert_match "bash completion", shell_output("#{bin}/agent-stripe completion bash")
  end
end
