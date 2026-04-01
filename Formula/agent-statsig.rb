class AgentStatsig < Formula
  desc "Statsig feature flag CLI for AI agents"
  homepage "https://github.com/shhac/agent-statsig"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.1.1/agent-statsig-darwin-arm64.tar.gz"
      sha256 "a64efeaa6b2370d7a749a87579823277d99dae2f998f75f39660268b56b264e4"
    end
    on_intel do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.1.1/agent-statsig-darwin-amd64.tar.gz"
      sha256 "f4bca0d7b7218c3e4464e4a16daf244957f312519f1d5359693b8c5636d0cc23"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.1.1/agent-statsig-linux-arm64.tar.gz"
      sha256 "1e2f4de430cd96a7544f38353fdcf5ac93674c236d687bdd0d9afd2e710f38f7"
    end
    on_intel do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.1.1/agent-statsig-linux-amd64.tar.gz"
      sha256 "4ece463a933cc60b69193a47721940b133eb90ddcd1d865e18a74172d71707b8"
    end
  end

  def install
    bin.install Dir["agent-statsig-*"].first => "agent-statsig"
  end

  test do
    assert_match "0.1.1", shell_output("#{bin}/agent-statsig --version")
    assert_match "Statsig", shell_output("#{bin}/agent-statsig --help")
  end
end
