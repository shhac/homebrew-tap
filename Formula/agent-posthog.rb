class AgentPosthog < Formula
  desc "PostHog product analytics CLI for AI agents"
  homepage "https://github.com/shhac/agent-posthog"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.6.0/agent-posthog-darwin-arm64.tar.gz"
      sha256 "8a005d45aaec8a0b87273512970d48a15ee712da5a86ea5c8c47c985248a2b33"
    end
    on_intel do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.6.0/agent-posthog-darwin-amd64.tar.gz"
      sha256 "07350d29267b70e1a34b76c5db423919d6ccf173602c5d694839411690c899ac"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.6.0/agent-posthog-linux-arm64.tar.gz"
      sha256 "b06645d132f8d67935cc6d091f2848a97691c67c1ed16e2cd477440eca963e0d"
    end
    on_intel do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.6.0/agent-posthog-linux-amd64.tar.gz"
      sha256 "deb40ddf3c16b032ff7de05d70522bc0a061434d6058a94921fd9ac632abb754"
    end
  end

  def install
    bin.install "agent-posthog"
    # Installs shell completions via `agent-posthog completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-posthog", "completion")
  end

  test do
    assert_match "0.6.0", shell_output("#{bin}/agent-posthog --version")
    assert_match "PostHog product analytics CLI", shell_output("#{bin}/agent-posthog --help")
    assert_match "#compdef agent-posthog", shell_output("#{bin}/agent-posthog completion zsh")
  end
end
