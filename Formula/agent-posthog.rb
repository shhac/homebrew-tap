class AgentPosthog < Formula
  desc "PostHog product analytics CLI for AI agents"
  homepage "https://github.com/shhac/agent-posthog"
  version "0.3.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.3.2/agent-posthog-darwin-arm64.tar.gz"
      sha256 "0d1c0fc9279fae4208bc8514b6984b7e0525f953708b1d4d9f515be7e073efe9"
    end
    on_intel do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.3.2/agent-posthog-darwin-amd64.tar.gz"
      sha256 "1e63f4f1287afe15594c069d2ef5386e9d8f45114a7d1989da7a1d567e6eb948"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.3.2/agent-posthog-linux-arm64.tar.gz"
      sha256 "cfde85bcdf5fd4daab52ac7cc5dbe9ce5abf4eab871468dfeed0fbbc7a8d1f8a"
    end
    on_intel do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.3.2/agent-posthog-linux-amd64.tar.gz"
      sha256 "91a361720e7bb798abca44c40c630dcc4058aac164eea53d8ae3c03892dd2adc"
    end
  end

  def install
    bin.install "agent-posthog"
    # Installs shell completions via `agent-posthog completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-posthog", "completion")
  end

  test do
    assert_match "0.3.2", shell_output("#{bin}/agent-posthog --version")
    assert_match "PostHog product analytics CLI", shell_output("#{bin}/agent-posthog --help")
    assert_match "#compdef agent-posthog", shell_output("#{bin}/agent-posthog completion zsh")
  end
end
