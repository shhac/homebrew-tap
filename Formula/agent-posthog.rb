class AgentPosthog < Formula
  desc "PostHog product analytics CLI for AI agents"
  homepage "https://github.com/shhac/agent-posthog"
  version "0.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.11.0/agent-posthog-darwin-arm64.tar.gz"
      sha256 "fadb84630505e8faaa88ab51184153a99648326d2e089d8645b4500245591661"
    end
    on_intel do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.11.0/agent-posthog-darwin-amd64.tar.gz"
      sha256 "2ce9c9abc2502db5010c7d0a856d399551f5cc39193f3b6765c43705115ce48d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.11.0/agent-posthog-linux-arm64.tar.gz"
      sha256 "f1fd2416a6ec557584a9944cc9a4e0740b47a0707259b07661ce09906a0a1861"
    end
    on_intel do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.11.0/agent-posthog-linux-amd64.tar.gz"
      sha256 "b824714e969d905df16653ce994f797e2051e11dd8ed943a1eaa6a3316383ca4"
    end
  end

  def install
    bin.install "agent-posthog"
    # Installs shell completions via `agent-posthog completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-posthog", "completion")
  end

  test do
    assert_match "0.11.0", shell_output("#{bin}/agent-posthog --version")
    assert_match "PostHog product analytics CLI", shell_output("#{bin}/agent-posthog --help")
    assert_match "#compdef agent-posthog", shell_output("#{bin}/agent-posthog completion zsh")
  end
end
