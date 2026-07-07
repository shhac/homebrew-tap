class AgentPosthog < Formula
  desc "PostHog product analytics CLI for AI agents"
  homepage "https://github.com/shhac/agent-posthog"
  version "0.13.1"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.13.1/agent-posthog-darwin-arm64.tar.gz"
      sha256 "88d0009c04f0e0aaa04e75f6c119e6b7b2eac729d75c81e6100fadd9d6f11e26"
    end
    on_intel do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.13.1/agent-posthog-darwin-amd64.tar.gz"
      sha256 "ebb30654737707b03c909a82ac99f709374f294005168402a49c20a4190eca99"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.13.1/agent-posthog-linux-arm64.tar.gz"
      sha256 "ae0b24605476a69e77c09342eb954009c5b89267b379fc2a26f15d241b066926"
    end
    on_intel do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.13.1/agent-posthog-linux-amd64.tar.gz"
      sha256 "6d35f05cc8c3c52c12b6b0bd56173afd84bd77165f259a6619ccac6d8b2d17a9"
    end
  end

  def install
    bin.install "agent-posthog"
    # Installs shell completions via `agent-posthog completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-posthog", "completion")
  end

  test do
    assert_match "0.13.1", shell_output("#{bin}/agent-posthog --version")
    assert_match "PostHog product analytics CLI", shell_output("#{bin}/agent-posthog --help")
    assert_match "#compdef agent-posthog", shell_output("#{bin}/agent-posthog completion zsh")
  end
end
