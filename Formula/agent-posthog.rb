class AgentPosthog < Formula
  desc "PostHog product analytics CLI for AI agents"
  homepage "https://github.com/shhac/agent-posthog"
  version "0.12.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.12.1/agent-posthog-darwin-arm64.tar.gz"
      sha256 "3bc7ca2ab5943627f0e899d270d86f09f0cf1432ff567f0c2691df7463276114"
    end
    on_intel do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.12.1/agent-posthog-darwin-amd64.tar.gz"
      sha256 "348979aa44cccc5acda04678b7bf7f8a8da08e9206e3235943643541487eb100"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.12.1/agent-posthog-linux-arm64.tar.gz"
      sha256 "713381cad5ecc5582ca5af95ffd8752565e77b1660ded747945648502ccbc2cc"
    end
    on_intel do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.12.1/agent-posthog-linux-amd64.tar.gz"
      sha256 "7d0739d103732da38bd891a5022c3824e0f7e0676e2ac83ad18b634fdea81774"
    end
  end

  def install
    bin.install "agent-posthog"
    # Installs shell completions via `agent-posthog completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-posthog", "completion")
  end

  test do
    assert_match "0.12.1", shell_output("#{bin}/agent-posthog --version")
    assert_match "PostHog product analytics CLI", shell_output("#{bin}/agent-posthog --help")
    assert_match "#compdef agent-posthog", shell_output("#{bin}/agent-posthog completion zsh")
  end
end
