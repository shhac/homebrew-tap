class AgentStatsig < Formula
  desc "Statsig feature flag CLI for AI agents"
  homepage "https://github.com/shhac/agent-statsig"
  version "0.13.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.13.0/agent-statsig-darwin-arm64.tar.gz"
      sha256 "b793496e4d4c8cadd16a75c1c43d8e7b85f8435d3df8564a20c0bc0f90fd6a3d"
    end
    on_intel do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.13.0/agent-statsig-darwin-amd64.tar.gz"
      sha256 "0ce54fdb4ce57f4288c39371572a21a8902545eeb0771195426cec26e2cba4de"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.13.0/agent-statsig-linux-arm64.tar.gz"
      sha256 "376b7b9cec3c9622dcce67d8b1c2c59430b84e639f6416a75eaa510ecdb00722"
    end
    on_intel do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.13.0/agent-statsig-linux-amd64.tar.gz"
      sha256 "920275100334fd933dd7854983bb01a86cfe383abbc4cdc3b0b71d3f94586533"
    end
  end

  def install
    bin.install "agent-statsig"
    # Installs shell completions via `agent-statsig completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-statsig", "completion")
  end

  test do
    assert_match "0.13.0", shell_output("#{bin}/agent-statsig --version")
    assert_match "Statsig feature flag CLI", shell_output("#{bin}/agent-statsig --help")
    assert_match "#compdef agent-statsig", shell_output("#{bin}/agent-statsig completion zsh")
  end
end
