class AgentPosthog < Formula
  desc "PostHog product analytics CLI for AI agents"
  homepage "https://github.com/shhac/agent-posthog"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.14.0/agent-posthog-darwin-arm64.tar.gz"
      sha256 "7a417df4e13f427fcb01d6d6c25819b6ca603286632f9a7d42478540f48ff6d9"
    end
    on_intel do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.14.0/agent-posthog-darwin-amd64.tar.gz"
      sha256 "2921058db6f3ffa1f409683befa17c50d32b4186e9c857216bd041c4f86308ce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.14.0/agent-posthog-linux-arm64.tar.gz"
      sha256 "f77e7411041aef5b0cb1a645a077c71458279ae41dd76b147be93625bd6d27d7"
    end
    on_intel do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.14.0/agent-posthog-linux-amd64.tar.gz"
      sha256 "f1ba227f4cc5b1149c3bd65f9a34f30841e91024c66125ce2e515bd5f7218555"
    end
  end

  def install
    bin.install "agent-posthog"
    # Installs shell completions via `agent-posthog completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-posthog", "completion")
  end

  test do
    assert_match "0.14.0", shell_output("#{bin}/agent-posthog --version")
    assert_match "PostHog product analytics CLI", shell_output("#{bin}/agent-posthog --help")
    assert_match "#compdef agent-posthog", shell_output("#{bin}/agent-posthog completion zsh")
  end
end
