class AgentPosthog < Formula
  desc "PostHog product analytics CLI for AI agents"
  homepage "https://github.com/shhac/agent-posthog"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.9.0/agent-posthog-darwin-arm64.tar.gz"
      sha256 "6cf4638f1f8a6a723c42dd768bd1a6ab61ddabfc52b6e8b64d0b80eb5ecfa056"
    end
    on_intel do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.9.0/agent-posthog-darwin-amd64.tar.gz"
      sha256 "5381bc06f93dc48f1d69786ccecc3151ff6e3f02b6dd209319c4efa0582dca5f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.9.0/agent-posthog-linux-arm64.tar.gz"
      sha256 "b1106433da96dcb4a90339aee2f741d5173c2bad9566a7a69969d3e7650428ac"
    end
    on_intel do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.9.0/agent-posthog-linux-amd64.tar.gz"
      sha256 "9f5eaab7cdeb3a004575e292cd36394b82341ea8612d88c92c5bafc8665782b8"
    end
  end

  def install
    bin.install "agent-posthog"
    # Installs shell completions via `agent-posthog completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-posthog", "completion")
  end

  test do
    assert_match "0.9.0", shell_output("#{bin}/agent-posthog --version")
    assert_match "PostHog product analytics CLI", shell_output("#{bin}/agent-posthog --help")
    assert_match "#compdef agent-posthog", shell_output("#{bin}/agent-posthog completion zsh")
  end
end
