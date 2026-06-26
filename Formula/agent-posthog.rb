class AgentPosthog < Formula
  desc "PostHog product analytics CLI for AI agents"
  homepage "https://github.com/shhac/agent-posthog"
  version "0.12.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.12.0/agent-posthog-darwin-arm64.tar.gz"
      sha256 "ebccde4182ac2fe3ae49e713b0e133fe7f28962fb38234baa7a4b5c1b3cb85a1"
    end
    on_intel do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.12.0/agent-posthog-darwin-amd64.tar.gz"
      sha256 "b7618a187e9c94bef6ced3f16bff1c4f2d00dcc59960ea7641f90b528ab9e8ba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.12.0/agent-posthog-linux-arm64.tar.gz"
      sha256 "a7cba7fe20a97e0f21727aab5fce0f94a527560ca3a6f7963293d5b2738b8bef"
    end
    on_intel do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.12.0/agent-posthog-linux-amd64.tar.gz"
      sha256 "6ee5ad0bff73b070d38728713f6a6c4b47dcdc3143913a5e00ef1fb367e3f1be"
    end
  end

  def install
    bin.install "agent-posthog"
    # Installs shell completions via `agent-posthog completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-posthog", "completion")
  end

  test do
    assert_match "0.12.0", shell_output("#{bin}/agent-posthog --version")
    assert_match "PostHog product analytics CLI", shell_output("#{bin}/agent-posthog --help")
    assert_match "#compdef agent-posthog", shell_output("#{bin}/agent-posthog completion zsh")
  end
end
