class AgentStatsig < Formula
  desc "Statsig feature flag CLI for AI agents"
  homepage "https://github.com/shhac/agent-statsig"
  version "0.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.11.0/agent-statsig-darwin-arm64.tar.gz"
      sha256 "82f4c8d202ec2aca52ad3611c1e6b58dc085d69b96d053a5daaf987dcdf6db74"
    end
    on_intel do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.11.0/agent-statsig-darwin-amd64.tar.gz"
      sha256 "14846654b53f83c7e7af09afa239d3211c1464e096de603e4f128447760f8fc3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.11.0/agent-statsig-linux-arm64.tar.gz"
      sha256 "6ddf1752837e766b79c14ed91b69aba1e3ad17edc21a7dbc121d918dafbe4791"
    end
    on_intel do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.11.0/agent-statsig-linux-amd64.tar.gz"
      sha256 "fd7f6a8484c28ea0884e5b48b7f5615edeecd452961afddae92878ae5b9310f9"
    end
  end

  def install
    bin.install "agent-statsig"
    # Installs shell completions via `agent-statsig completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-statsig", "completion")
  end

  test do
    assert_match "0.11.0", shell_output("#{bin}/agent-statsig --version")
    assert_match "Statsig feature flag CLI", shell_output("#{bin}/agent-statsig --help")
    assert_match "#compdef agent-statsig", shell_output("#{bin}/agent-statsig completion zsh")
  end
end
