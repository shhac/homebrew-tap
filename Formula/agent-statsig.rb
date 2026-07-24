class AgentStatsig < Formula
  desc "Statsig feature flag CLI for AI agents"
  homepage "https://github.com/shhac/agent-statsig"
  version "0.17.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.17.0/agent-statsig-darwin-arm64.tar.gz"
      sha256 "ac4aba4d27d886cc2ae443fb50c5eaeccf95fe9bc2f570b2d8029149e63bc442"
    end
    on_intel do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.17.0/agent-statsig-darwin-amd64.tar.gz"
      sha256 "0db63228ab793785298d352556f593dae8f3a1340847742246c1324f0084cca5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.17.0/agent-statsig-linux-arm64.tar.gz"
      sha256 "34cca9b625fe529c9ca0e69eaf01a09f0d05308069911e0dc5bcb238733166ac"
    end
    on_intel do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.17.0/agent-statsig-linux-amd64.tar.gz"
      sha256 "87aae0ae23dc1089331ff47c01b2ce1679295ac198a5fc3d5d97b99466660a83"
    end
  end

  def install
    bin.install "agent-statsig"
    # Installs shell completions via `agent-statsig completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-statsig", "completion")
  end

  test do
    assert_match "0.17.0", shell_output("#{bin}/agent-statsig --version")
    assert_match "Statsig feature flag CLI", shell_output("#{bin}/agent-statsig --help")
    assert_match "#compdef agent-statsig", shell_output("#{bin}/agent-statsig completion zsh")
  end
end
