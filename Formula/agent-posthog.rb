class AgentPosthog < Formula
  desc "PostHog product analytics CLI for AI agents"
  homepage "https://github.com/shhac/agent-posthog"
  version "0.13.2"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.13.2/agent-posthog-darwin-arm64.tar.gz"
      sha256 "77a4946dc040013ea7ebe407585d85fc6d174559babf618ccc06ff3e5643f531"
    end
    on_intel do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.13.2/agent-posthog-darwin-amd64.tar.gz"
      sha256 "cb03c6fcbe732154333cfaabb17067082907e2ef5fc4b8513c287223b59ed011"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.13.2/agent-posthog-linux-arm64.tar.gz"
      sha256 "fa43030a0ca67c1504e622e66f17db294bd172c613cf79f1dbfd53dabb937569"
    end
    on_intel do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.13.2/agent-posthog-linux-amd64.tar.gz"
      sha256 "e849b25b6b6e63084cbe381ec22bc92f11b68772982bc210e2a877be937f50c7"
    end
  end

  def install
    bin.install "agent-posthog"
    # Installs shell completions via `agent-posthog completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-posthog", "completion")
  end

  test do
    assert_match "0.13.2", shell_output("#{bin}/agent-posthog --version")
    assert_match "PostHog product analytics CLI", shell_output("#{bin}/agent-posthog --help")
    assert_match "#compdef agent-posthog", shell_output("#{bin}/agent-posthog completion zsh")
  end
end
