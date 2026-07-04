class AgentStatsig < Formula
  desc "Statsig feature flag CLI for AI agents"
  homepage "https://github.com/shhac/agent-statsig"
  version "0.14.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.14.0/agent-statsig-darwin-arm64.tar.gz"
      sha256 "9f763e559b9c06b943694956a7f6274a836b980111349677b8f55f02fe0bcc95"
    end
    on_intel do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.14.0/agent-statsig-darwin-amd64.tar.gz"
      sha256 "811a9c2a634ff1dfa1f3ced21c57081d8e5498a1c456189cb03eb5536398b1a0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.14.0/agent-statsig-linux-arm64.tar.gz"
      sha256 "1323b492a9b8b900d0235917982afd5a40861faaf2dd90f9bafc75f6acee5ea0"
    end
    on_intel do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.14.0/agent-statsig-linux-amd64.tar.gz"
      sha256 "68b677524df77df2966fe823e7c2d5c8113949ab161e202a4947efd0f7c21d7b"
    end
  end

  def install
    bin.install "agent-statsig"
    # Installs shell completions via `agent-statsig completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-statsig", "completion")
  end

  test do
    assert_match "0.14.0", shell_output("#{bin}/agent-statsig --version")
    assert_match "Statsig feature flag CLI", shell_output("#{bin}/agent-statsig --help")
    assert_match "#compdef agent-statsig", shell_output("#{bin}/agent-statsig completion zsh")
  end
end
