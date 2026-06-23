class AgentPosthog < Formula
  desc "PostHog product analytics CLI for AI agents"
  homepage "https://github.com/shhac/agent-posthog"
  version "0.11.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.11.1/agent-posthog-darwin-arm64.tar.gz"
      sha256 "7d4a031b4a746bc54810dc397f845e5c13c549d1c7ae8aeeb6b6ccfc0297479a"
    end
    on_intel do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.11.1/agent-posthog-darwin-amd64.tar.gz"
      sha256 "3b73d1fbe27f0f3312b622070ea7d3dfa06aaf431c217f5bbbb26ba836eb28bc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.11.1/agent-posthog-linux-arm64.tar.gz"
      sha256 "2d47cc3bc2ab5ca3fe727dd54399823101502dc39e4d47b93a24617dbd573845"
    end
    on_intel do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.11.1/agent-posthog-linux-amd64.tar.gz"
      sha256 "389a08ae373d617075fbff1005913d1651d8b38a1b4a4389aeb7fede7e5e39b9"
    end
  end

  def install
    bin.install "agent-posthog"
    # Installs shell completions via `agent-posthog completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-posthog", "completion")
  end

  test do
    assert_match "0.11.1", shell_output("#{bin}/agent-posthog --version")
    assert_match "PostHog product analytics CLI", shell_output("#{bin}/agent-posthog --help")
    assert_match "#compdef agent-posthog", shell_output("#{bin}/agent-posthog completion zsh")
  end
end
