class AgentStatsig < Formula
  desc "Statsig feature flag CLI for AI agents"
  homepage "https://github.com/shhac/agent-statsig"
  version "0.15.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.15.0/agent-statsig-darwin-arm64.tar.gz"
      sha256 "fea7dbbec2b25e83defc8527653d708d4b166f8b9d640c1a95260bbf2e8d39fb"
    end
    on_intel do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.15.0/agent-statsig-darwin-amd64.tar.gz"
      sha256 "9c696d2aa9c99ec585d1673d8e3657a02f9e6a6912eea1bde7ea0caa231b2c73"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.15.0/agent-statsig-linux-arm64.tar.gz"
      sha256 "f76d50c4cc85cc29b1fe486556c78a3f3d14f97bafae2562f2284fb2d2ca5f9b"
    end
    on_intel do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.15.0/agent-statsig-linux-amd64.tar.gz"
      sha256 "866913eaca4a62589e9664b5a33056b16adea20ccce8caf1d878879b1e048c32"
    end
  end

  def install
    bin.install "agent-statsig"
    # Installs shell completions via `agent-statsig completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-statsig", "completion")
  end

  test do
    assert_match "0.15.0", shell_output("#{bin}/agent-statsig --version")
    assert_match "Statsig feature flag CLI", shell_output("#{bin}/agent-statsig --help")
    assert_match "#compdef agent-statsig", shell_output("#{bin}/agent-statsig completion zsh")
  end
end
