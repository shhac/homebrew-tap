class AgentStripe < Formula
  desc "Stripe incident triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-stripe"
  version "0.7.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.7.1/agent-stripe-darwin-arm64.tar.gz"
      sha256 "91a6433aed3bf15eacd13a58d76e4341dbf49295604201cf379f0bc00405b9b0"
    end
    on_intel do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.7.1/agent-stripe-darwin-amd64.tar.gz"
      sha256 "b40bbcd43c9c3316bba4363a3d6850293345d907cee5c6a9d6f794fe2124a2fb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.7.1/agent-stripe-linux-arm64.tar.gz"
      sha256 "26bf75f07e3b16d4afc653a4985a6b1f26a0ba7d7d749bdff6a49b47094dee5d"
    end
    on_intel do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.7.1/agent-stripe-linux-amd64.tar.gz"
      sha256 "f6a0970c9af6fe42add51fdda21a0c987040acf24c7ffb819eff09a2d1844053"
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
    assert_match "0.7.1", shell_output("#{bin}/agent-stripe --version")
    assert_match "Stripe incident triage CLI", shell_output("#{bin}/agent-stripe --help")
    # Completion subcommand must produce something for each supported shell.
    assert_match "#compdef agent-stripe", shell_output("#{bin}/agent-stripe completion zsh")
    assert_match "bash completion", shell_output("#{bin}/agent-stripe completion bash")
  end
end
