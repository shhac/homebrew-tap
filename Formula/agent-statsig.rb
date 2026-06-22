class AgentStatsig < Formula
  desc "Statsig feature flag CLI for AI agents"
  homepage "https://github.com/shhac/agent-statsig"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.8.0/agent-statsig-darwin-arm64.tar.gz"
      sha256 "e4f439724b7d18710fb0d8765b20b6105ac590d3971d1e061f8b10505d334abb"
    end
    on_intel do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.8.0/agent-statsig-darwin-amd64.tar.gz"
      sha256 "e246ab2d628ce415b9132e9316a30a8a7cedf56c2a87922d952ca8b51213a409"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.8.0/agent-statsig-linux-arm64.tar.gz"
      sha256 "f118b44368644561cddd2301e35362b32b941e87eb8005fdbc556388eafe0e12"
    end
    on_intel do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.8.0/agent-statsig-linux-amd64.tar.gz"
      sha256 "68f93c97d021855524afb4bdadbd737ef0d2f23768b265c8b2dc0f2f70cb4f86"
    end
  end

  def install
    bin.install "agent-statsig"
    # Installs shell completions via `agent-statsig completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-statsig", "completion")
  end

  test do
    assert_match "0.8.0", shell_output("#{bin}/agent-statsig --version")
    assert_match "Statsig feature flag CLI", shell_output("#{bin}/agent-statsig --help")
    assert_match "#compdef agent-statsig", shell_output("#{bin}/agent-statsig completion zsh")
  end
end
