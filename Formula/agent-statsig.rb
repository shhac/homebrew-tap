class AgentStatsig < Formula
  desc "Statsig feature flag CLI for AI agents"
  homepage "https://github.com/shhac/agent-statsig"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.3.0/agent-statsig-darwin-arm64.tar.gz"
      sha256 "bf9a25fc369d5c2e1b3602954d5d26d222f024a6358b8da17795b5f8f3c1b607"
    end
    on_intel do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.3.0/agent-statsig-darwin-amd64.tar.gz"
      sha256 "572412bd82d5cb643294813d5e466d683984a9876d6afda9f06d1036d6f1d09e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.3.0/agent-statsig-linux-arm64.tar.gz"
      sha256 "6d1c4df641b168c89322045fbc44d240d68f0d3a0a70c20041735e570843aa59"
    end
    on_intel do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.3.0/agent-statsig-linux-amd64.tar.gz"
      sha256 "b3d44284230010a965c146c03e8d7830e0e41b0fe1661189cb9c5969c7993de5"
    end
  end

  def install
    bin.install Dir["agent-statsig-*"].first => "agent-statsig"
  end

  test do
    assert_match "0.3.0", shell_output("#{bin}/agent-statsig --version")
    assert_match "Statsig", shell_output("#{bin}/agent-statsig --help")
  end
end
