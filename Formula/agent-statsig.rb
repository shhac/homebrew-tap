class AgentStatsig < Formula
  desc "Statsig feature flag CLI for AI agents"
  homepage "https://github.com/shhac/agent-statsig"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.7.0/agent-statsig-darwin-arm64.tar.gz"
      sha256 "39ed1b376ae36265c1ef9b0f3b79b9e7ae9a77287e33f3603fd6fa931010d573"
    end
    on_intel do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.7.0/agent-statsig-darwin-amd64.tar.gz"
      sha256 "8bfb7827176de3a82705b7e7f7e2fee0d65502860d0a29838564481ab95282e9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.7.0/agent-statsig-linux-arm64.tar.gz"
      sha256 "77452fb0d975f2ec8463fe9edc4395a06ca647640dc3b969fbef4be035cfdd05"
    end
    on_intel do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.7.0/agent-statsig-linux-amd64.tar.gz"
      sha256 "3bc7b103ea1e26162df86a846974dd549fbf151f29dc05bfbf0442d731b9ff21"
    end
  end

  def install
    bin.install "agent-statsig"
    # Installs shell completions via `agent-statsig completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-statsig", "completion")
  end

  test do
    assert_match "0.7.0", shell_output("#{bin}/agent-statsig --version")
    assert_match "Statsig feature flag CLI", shell_output("#{bin}/agent-statsig --help")
    assert_match "#compdef agent-statsig", shell_output("#{bin}/agent-statsig completion zsh")
  end
end
