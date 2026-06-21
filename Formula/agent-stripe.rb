class AgentStripe < Formula
  desc "Stripe incident triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-stripe"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.7.0/agent-stripe-darwin-arm64.tar.gz"
      sha256 "f94da379c0e0b4cce39b0765e40934b6152db43a82498b7f426c683e5441c3b8"
    end
    on_intel do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.7.0/agent-stripe-darwin-amd64.tar.gz"
      sha256 "b1e8fe68c1ed146fc9acfb8dfb827cab054c698d137c434df87ad973df890e32"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.7.0/agent-stripe-linux-arm64.tar.gz"
      sha256 "d9d540a01f462662e78c9a685cecea6da5d3bd03f6d739363e4c7e8134c14710"
    end
    on_intel do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.7.0/agent-stripe-linux-amd64.tar.gz"
      sha256 "3c79c99b889d9ccbb19668ccc03c705e7cd41d1dd822b01850b29feb638d745c"
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
    assert_match "0.7.0", shell_output("#{bin}/agent-stripe --version")
    assert_match "Stripe incident triage CLI", shell_output("#{bin}/agent-stripe --help")
    # Completion subcommand must produce something for each supported shell.
    assert_match "#compdef agent-stripe", shell_output("#{bin}/agent-stripe completion zsh")
    assert_match "bash completion", shell_output("#{bin}/agent-stripe completion bash")
  end
end
