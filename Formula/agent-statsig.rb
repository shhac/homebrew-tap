class AgentStatsig < Formula
  desc "Statsig feature flag CLI for AI agents"
  homepage "https://github.com/shhac/agent-statsig"
  version "0.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.10.0/agent-statsig-darwin-arm64.tar.gz"
      sha256 "92195fde35bc184aaf2045be4000a233f214cdaa1cbc99ed5e1d672597b104c8"
    end
    on_intel do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.10.0/agent-statsig-darwin-amd64.tar.gz"
      sha256 "50364a32d9bd389a65785df8f14657e936e25d56757efff82e94938e94437436"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.10.0/agent-statsig-linux-arm64.tar.gz"
      sha256 "66f22b313580278e8b381fa3119b543cb3698ec3f49882c542e9272586aa2fed"
    end
    on_intel do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.10.0/agent-statsig-linux-amd64.tar.gz"
      sha256 "d0a02defea4193777997dded5f712ca2eae0426c467405224c2c541ad7bd517d"
    end
  end

  def install
    bin.install "agent-statsig"
    # Installs shell completions via `agent-statsig completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-statsig", "completion")
  end

  test do
    assert_match "0.10.0", shell_output("#{bin}/agent-statsig --version")
    assert_match "Statsig feature flag CLI", shell_output("#{bin}/agent-statsig --help")
    assert_match "#compdef agent-statsig", shell_output("#{bin}/agent-statsig completion zsh")
  end
end
