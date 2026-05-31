class AgentPosthog < Formula
  desc "PostHog product analytics CLI for AI agents"
  homepage "https://github.com/shhac/agent-posthog"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.1.1/agent-posthog-darwin-arm64.tar.gz"
      sha256 "31d33aecb1d0d0166146d2d07cb61882a27e22098e9fb1ac60471f85618d98e3"
    end
    on_intel do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.1.1/agent-posthog-darwin-amd64.tar.gz"
      sha256 "d2dd468103b52b2398de4fe1833005f9108c97186afd5fce955d632108b674e9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.1.1/agent-posthog-linux-arm64.tar.gz"
      sha256 "f521b1634c701cdd597f47ea9131bce9cd6608416724eb24c8636ff722f99887"
    end
    on_intel do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.1.1/agent-posthog-linux-amd64.tar.gz"
      sha256 "8a63fcf7e57bd04db003d47985b8002cd7fe7362204dc9a97aef0d7eda15093d"
    end
  end

  def install
    bin.install Dir["agent-posthog-*"].first => "agent-posthog"
    # Runs `agent-posthog completion bash|zsh|fish` and installs each to brew's
    # standard completion paths. zsh and fish pick them up via the
    # default brew shellenv; bash needs `brew install bash-completion@2`.
    generate_completions_from_executable(bin/"agent-posthog", "completion")
  end

  test do
    assert_match "0.1.1", shell_output("#{bin}/agent-posthog --version")
    assert_match "Never paste API keys", shell_output("#{bin}/agent-posthog usage")
    # Completion subcommand must produce something for each supported shell.
    assert_match "#compdef agent-posthog", shell_output("#{bin}/agent-posthog completion zsh")
    assert_match "bash completion", shell_output("#{bin}/agent-posthog completion bash")
  end
end
