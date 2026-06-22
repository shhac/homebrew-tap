class AgentPosthog < Formula
  desc "PostHog product analytics CLI for AI agents"
  homepage "https://github.com/shhac/agent-posthog"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.7.0/agent-posthog-darwin-arm64.tar.gz"
      sha256 "c30642135920e885f9d89c1e8a8ae9605ba96dec07bd9648c19fc30f63615c4d"
    end
    on_intel do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.7.0/agent-posthog-darwin-amd64.tar.gz"
      sha256 "26c4bfc7d3c0367bad6a395ba8edab1d4b04733058f6581f8cdb98bc3332967d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.7.0/agent-posthog-linux-arm64.tar.gz"
      sha256 "f929497977e598f4f9a6328e2a5a36716fa985a4cf3a8454e8af2943dd4e8629"
    end
    on_intel do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.7.0/agent-posthog-linux-amd64.tar.gz"
      sha256 "d63c037db0eb8aa3c14e29e5d4c5b61bdfc788e8f868ab9dd6e3984c01b49207"
    end
  end

  def install
    bin.install "agent-posthog"
    # Installs shell completions via `agent-posthog completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-posthog", "completion")
  end

  test do
    assert_match "0.7.0", shell_output("#{bin}/agent-posthog --version")
    assert_match "PostHog product analytics CLI", shell_output("#{bin}/agent-posthog --help")
    assert_match "#compdef agent-posthog", shell_output("#{bin}/agent-posthog completion zsh")
  end
end
