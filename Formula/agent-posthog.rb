class AgentPosthog < Formula
  desc "PostHog product analytics CLI for AI agents"
  homepage "https://github.com/shhac/agent-posthog"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.8.0/agent-posthog-darwin-arm64.tar.gz"
      sha256 "37ece2f0dc5c8ad3d9c327d57bac3716b07d1cd5032c4ec1fb8fb844a9cdf856"
    end
    on_intel do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.8.0/agent-posthog-darwin-amd64.tar.gz"
      sha256 "7d9cd9719547310c36b83a85c4e3a04fed3fa12e9df4db6b61128a0263f7c83a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.8.0/agent-posthog-linux-arm64.tar.gz"
      sha256 "adc2d808c8d1adb94e0687c5ec7b293c622a9a4fe40d8535f510ced571268d65"
    end
    on_intel do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.8.0/agent-posthog-linux-amd64.tar.gz"
      sha256 "963ff4a20abfc5f2c6fe97111af8fa7cb496d50854b3c21b1151d5b3048b1ae6"
    end
  end

  def install
    bin.install "agent-posthog"
    # Installs shell completions via `agent-posthog completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-posthog", "completion")
  end

  test do
    assert_match "0.8.0", shell_output("#{bin}/agent-posthog --version")
    assert_match "PostHog product analytics CLI", shell_output("#{bin}/agent-posthog --help")
    assert_match "#compdef agent-posthog", shell_output("#{bin}/agent-posthog completion zsh")
  end
end
