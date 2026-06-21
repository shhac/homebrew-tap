class AgentPosthog < Formula
  desc "PostHog product analytics CLI for AI agents"
  homepage "https://github.com/shhac/agent-posthog"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.3.1/agent-posthog-darwin-arm64.tar.gz"
      sha256 "753b6a9b337c272a165658b551671124e8146927fc5a6a1ec335f5b5540d997b"
    end
    on_intel do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.3.1/agent-posthog-darwin-amd64.tar.gz"
      sha256 "b611e6a4c26318bf89620c620e4618c2897423ef35084f2b5113047aa304a52a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.3.1/agent-posthog-linux-arm64.tar.gz"
      sha256 "b97e4f8f9e4bd17f54b898726e936d4cf07bf7649b2322e563f382e837eee9b3"
    end
    on_intel do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.3.1/agent-posthog-linux-amd64.tar.gz"
      sha256 "38da5afbd256050cd2cff2cfc32b32dcece9c76bc1bbca7600ccb0efca32b7ea"
    end
  end

  def install
    bin.install "agent-posthog"
    # Installs shell completions via `agent-posthog completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-posthog", "completion")
  end

  test do
    assert_match "0.3.1", shell_output("#{bin}/agent-posthog --version")
    assert_match "PostHog product analytics CLI", shell_output("#{bin}/agent-posthog --help")
    assert_match "#compdef agent-posthog", shell_output("#{bin}/agent-posthog completion zsh")
  end
end
