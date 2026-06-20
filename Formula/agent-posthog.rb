class AgentPosthog < Formula
  desc "PostHog product analytics CLI for AI agents"
  homepage "https://github.com/shhac/agent-posthog"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.2.0/agent-posthog-darwin-arm64.tar.gz"
      sha256 "ce16383ce98bb1bf9b0224a69665334a6ad06409d7ef895cb31346538c1d5dcf"
    end
    on_intel do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.2.0/agent-posthog-darwin-amd64.tar.gz"
      sha256 "4eaff0ffde82e89f27eb1d105027b467f85a746c2d4303715f6bb28370cf19df"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.2.0/agent-posthog-linux-arm64.tar.gz"
      sha256 "bc6ea5904ca73e2fbb6fb7cb513314efe3599f3bda896cad155743d10e290fae"
    end
    on_intel do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.2.0/agent-posthog-linux-amd64.tar.gz"
      sha256 "7ba82d2bb89002af851035f34051f23c68998abcffdd16e86c75f35505c21e3a"
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
    assert_match "0.2.0", shell_output("#{bin}/agent-posthog --version")
    assert_match "Never paste API keys", shell_output("#{bin}/agent-posthog usage")
    # Completion subcommand must produce something for each supported shell.
    assert_match "#compdef agent-posthog", shell_output("#{bin}/agent-posthog completion zsh")
    assert_match "bash completion", shell_output("#{bin}/agent-posthog completion bash")
  end
end
