class AgentStatsig < Formula
  desc "Statsig feature flag CLI for AI agents"
  homepage "https://github.com/shhac/agent-statsig"
  version "0.16.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.16.0/agent-statsig-darwin-arm64.tar.gz"
      sha256 "fb4e4a9996dd9ba0b427d3d97fea3b164acec6cb281bc575bac083121fa3182a"
    end
    on_intel do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.16.0/agent-statsig-darwin-amd64.tar.gz"
      sha256 "d24b9b75772a84097834b0c0a0c2c7e347afb6e124b10bbd7465478aa5d8a28e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.16.0/agent-statsig-linux-arm64.tar.gz"
      sha256 "19132ce7a56f6b2e00eef03f7465fd96a5002fe7d63e9286a7b89123c7772e6d"
    end
    on_intel do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.16.0/agent-statsig-linux-amd64.tar.gz"
      sha256 "d7daab5d4d672281e9cccd9c466ec0a71b2aef623ec135fcf75a5c7333a5174f"
    end
  end

  def install
    bin.install "agent-statsig"
    # Installs shell completions via `agent-statsig completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-statsig", "completion")
  end

  test do
    assert_match "0.16.0", shell_output("#{bin}/agent-statsig --version")
    assert_match "Statsig feature flag CLI", shell_output("#{bin}/agent-statsig --help")
    assert_match "#compdef agent-statsig", shell_output("#{bin}/agent-statsig completion zsh")
  end
end
