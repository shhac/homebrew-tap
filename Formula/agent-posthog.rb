class AgentPosthog < Formula
  desc "PostHog product analytics CLI for AI agents"
  homepage "https://github.com/shhac/agent-posthog"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.15.0/agent-posthog-darwin-arm64.tar.gz"
      sha256 "31837610211a53bb7c966b51e630d5eebd3608c79bbc6814cec788cbce3cf467"
    end
    on_intel do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.15.0/agent-posthog-darwin-amd64.tar.gz"
      sha256 "cf48d3cf8e3381830d26489bc1cbfc90375afb04ad5d8c59d811a50d29005d7c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.15.0/agent-posthog-linux-arm64.tar.gz"
      sha256 "051331807e40ff5b44825c81068d71d59ea4e6bc217bf6bdfdae67737c48f720"
    end
    on_intel do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.15.0/agent-posthog-linux-amd64.tar.gz"
      sha256 "a4e326d94fd21036d88bef463344540113b900ac64a7bf4e1e1f95a665554fbd"
    end
  end

  def install
    bin.install "agent-posthog"
    # Installs shell completions via `agent-posthog completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-posthog", "completion")
  end

  test do
    assert_match "0.15.0", shell_output("#{bin}/agent-posthog --version")
    assert_match "PostHog product analytics CLI", shell_output("#{bin}/agent-posthog --help")
    assert_match "#compdef agent-posthog", shell_output("#{bin}/agent-posthog completion zsh")
  end
end
