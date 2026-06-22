class AgentPosthog < Formula
  desc "PostHog product analytics CLI for AI agents"
  homepage "https://github.com/shhac/agent-posthog"
  version "0.9.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.9.1/agent-posthog-darwin-arm64.tar.gz"
      sha256 "d02bf7e81b55f254bf0a16bf2ff54740e75271c861fa53014901a9542a8aff5d"
    end
    on_intel do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.9.1/agent-posthog-darwin-amd64.tar.gz"
      sha256 "dca8d8e51db03fcfad73feb95ea78f98a33b4f1708387df3f3b405f32ca39805"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.9.1/agent-posthog-linux-arm64.tar.gz"
      sha256 "d064cff1b02f78dc22d59751cba3586a88a197cfbfc03d1bd7c76b4961a8e618"
    end
    on_intel do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.9.1/agent-posthog-linux-amd64.tar.gz"
      sha256 "f62dadefdea2f0a992ca0e4df50114876ba04fed4378e047a2683d5bd3370774"
    end
  end

  def install
    bin.install "agent-posthog"
    # Installs shell completions via `agent-posthog completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-posthog", "completion")
  end

  test do
    assert_match "0.9.1", shell_output("#{bin}/agent-posthog --version")
    assert_match "PostHog product analytics CLI", shell_output("#{bin}/agent-posthog --help")
    assert_match "#compdef agent-posthog", shell_output("#{bin}/agent-posthog completion zsh")
  end
end
