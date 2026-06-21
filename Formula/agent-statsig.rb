class AgentStatsig < Formula
  desc "Statsig feature flag CLI for AI agents"
  homepage "https://github.com/shhac/agent-statsig"
  version "0.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.5.1/agent-statsig-darwin-arm64.tar.gz"
      sha256 "14240eff561cf4b570d597afa31aa5edbb14b5844fe2a57ced503156bbc13787"
    end
    on_intel do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.5.1/agent-statsig-darwin-amd64.tar.gz"
      sha256 "290a564a03dda56e72de55b18ebfc2b50478709e7b5014d1bf9e2205f754827e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.5.1/agent-statsig-linux-arm64.tar.gz"
      sha256 "933737d4bb1641aaec05b94ea6a7857b211015210219725a715715ab1f948537"
    end
    on_intel do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.5.1/agent-statsig-linux-amd64.tar.gz"
      sha256 "4fc85bdba39abbd747987db9e80b119c63025a2bab3b812254b94271f026f2f6"
    end
  end

  def install
    bin.install "agent-statsig"
    # Installs shell completions via `agent-statsig completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-statsig", "completion")
  end

  test do
    assert_match "0.5.1", shell_output("#{bin}/agent-statsig --version")
    assert_match "Statsig feature flag CLI", shell_output("#{bin}/agent-statsig --help")
    assert_match "#compdef agent-statsig", shell_output("#{bin}/agent-statsig completion zsh")
  end
end
