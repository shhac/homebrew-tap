class AgentPosthog < Formula
  desc "PostHog product analytics CLI for AI agents"
  homepage "https://github.com/shhac/agent-posthog"
  version "0.13.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.13.0/agent-posthog-darwin-arm64.tar.gz"
      sha256 "61110100df885e43f3186fa34bd01f024da1211eab418bea60c6c191fb25e96a"
    end
    on_intel do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.13.0/agent-posthog-darwin-amd64.tar.gz"
      sha256 "fbbdc7f23cb0c4de28c3e9a09524f6d8b0ba796b220ffa43e615f0819da07cc6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.13.0/agent-posthog-linux-arm64.tar.gz"
      sha256 "6b3cb8a4966272749f02db903db4c6e9a984337e15aa4071e94ffc785d4ab176"
    end
    on_intel do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.13.0/agent-posthog-linux-amd64.tar.gz"
      sha256 "64084ced8e7c6ed83af9c7dbf967c6531b5e0a13d7de5bb6dc228c1c8ee11fa1"
    end
  end

  def install
    bin.install "agent-posthog"
    # Installs shell completions via `agent-posthog completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-posthog", "completion")
  end

  test do
    assert_match "0.13.0", shell_output("#{bin}/agent-posthog --version")
    assert_match "PostHog product analytics CLI", shell_output("#{bin}/agent-posthog --help")
    assert_match "#compdef agent-posthog", shell_output("#{bin}/agent-posthog completion zsh")
  end
end
