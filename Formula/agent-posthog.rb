class AgentPosthog < Formula
  desc "PostHog product analytics CLI for AI agents"
  homepage "https://github.com/shhac/agent-posthog"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.5.0/agent-posthog-darwin-arm64.tar.gz"
      sha256 "d71381608541bd0cd68bb97d4a24d056dd55405a909332de490f01d9f2eea2c2"
    end
    on_intel do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.5.0/agent-posthog-darwin-amd64.tar.gz"
      sha256 "8bc5b4570e840451977dbada5f9d118e1d827b4743d8a49c3b29f294474724bb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.5.0/agent-posthog-linux-arm64.tar.gz"
      sha256 "08d2bf6bd366745241b69856f1d303301fbf711beee9037ff85f74a659e7c647"
    end
    on_intel do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.5.0/agent-posthog-linux-amd64.tar.gz"
      sha256 "2cc4393eaf09caa128fa2448ad6154be27f9d79641d53262a78537c404fbc8e0"
    end
  end

  def install
    bin.install "agent-posthog"
    # Installs shell completions via `agent-posthog completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-posthog", "completion")
  end

  test do
    assert_match "0.5.0", shell_output("#{bin}/agent-posthog --version")
    assert_match "PostHog product analytics CLI", shell_output("#{bin}/agent-posthog --help")
    assert_match "#compdef agent-posthog", shell_output("#{bin}/agent-posthog completion zsh")
  end
end
