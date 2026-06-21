class AgentPosthog < Formula
  desc "PostHog product analytics CLI for AI agents"
  homepage "https://github.com/shhac/agent-posthog"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.4.0/agent-posthog-darwin-arm64.tar.gz"
      sha256 "384b9f9d7cb20ebfcc75016adfad1fe9ce7e2f88c674f4cb17391bb1792df8ca"
    end
    on_intel do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.4.0/agent-posthog-darwin-amd64.tar.gz"
      sha256 "6a452f2575153c29a61375fdb63cc38697ca879e8c0772d871918040c4f94af5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.4.0/agent-posthog-linux-arm64.tar.gz"
      sha256 "0ca28629847de54c931b16affa2218ef4155a2fac9a46bec66e00a43f774d80b"
    end
    on_intel do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.4.0/agent-posthog-linux-amd64.tar.gz"
      sha256 "18796f11c7976c524e088b02cc8d293e38859b6683ebe40e37677d1b0c2fc2f9"
    end
  end

  def install
    bin.install "agent-posthog"
    # Installs shell completions via `agent-posthog completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-posthog", "completion")
  end

  test do
    assert_match "0.4.0", shell_output("#{bin}/agent-posthog --version")
    assert_match "PostHog product analytics CLI", shell_output("#{bin}/agent-posthog --help")
    assert_match "#compdef agent-posthog", shell_output("#{bin}/agent-posthog completion zsh")
  end
end
