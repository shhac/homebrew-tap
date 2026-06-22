class AgentPosthog < Formula
  desc "PostHog product analytics CLI for AI agents"
  homepage "https://github.com/shhac/agent-posthog"
  version "0.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.10.0/agent-posthog-darwin-arm64.tar.gz"
      sha256 "e5bbe7281351be4e72b1834559c2606cc1cbca7bc567e07a686a1d716dc82236"
    end
    on_intel do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.10.0/agent-posthog-darwin-amd64.tar.gz"
      sha256 "1fd78f2a4a1f6c79fb42541ee80e1884e22ac300657ef754c699aa706c2856d1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.10.0/agent-posthog-linux-arm64.tar.gz"
      sha256 "927fda9020d34fbca515ba17dced9b546113be09b3d713478e4e0432b41d9be8"
    end
    on_intel do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.10.0/agent-posthog-linux-amd64.tar.gz"
      sha256 "7ef9655c5de46ea01b241388dc03693493d3afc299738bd955298d1818e6b94e"
    end
  end

  def install
    bin.install "agent-posthog"
    # Installs shell completions via `agent-posthog completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-posthog", "completion")
  end

  test do
    assert_match "0.10.0", shell_output("#{bin}/agent-posthog --version")
    assert_match "PostHog product analytics CLI", shell_output("#{bin}/agent-posthog --help")
    assert_match "#compdef agent-posthog", shell_output("#{bin}/agent-posthog completion zsh")
  end
end
