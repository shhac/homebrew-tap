class AgentPosthog < Formula
  desc "PostHog product analytics CLI for AI agents"
  homepage "https://github.com/shhac/agent-posthog"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.3.0/agent-posthog-darwin-arm64.tar.gz"
      sha256 "fe2feba20ec846084c75e28f82a542700030ea557293c6bb4107766a95687ef9"
    end
    on_intel do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.3.0/agent-posthog-darwin-amd64.tar.gz"
      sha256 "4013fa20bd4998d0e13949274be6a198233cb803d4fc2ff5a816f847845dda0e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.3.0/agent-posthog-linux-arm64.tar.gz"
      sha256 "6823a7c370d21cd12d93ce906b41ca286a939843c5ab3226084c7730e0a888f8"
    end
    on_intel do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.3.0/agent-posthog-linux-amd64.tar.gz"
      sha256 "39be61f745d7b859b68f0e363b55f307b020521a0773ce61590ab8261e64df8e"
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
    assert_match "0.3.0", shell_output("#{bin}/agent-posthog --version")
    assert_match "Never paste API keys", shell_output("#{bin}/agent-posthog usage")
    # Completion subcommand must produce something for each supported shell.
    assert_match "#compdef agent-posthog", shell_output("#{bin}/agent-posthog completion zsh")
    assert_match "bash completion", shell_output("#{bin}/agent-posthog completion bash")
  end
end
