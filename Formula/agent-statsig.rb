class AgentStatsig < Formula
  desc "Statsig feature flag CLI for AI agents"
  homepage "https://github.com/shhac/agent-statsig"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.1.2/agent-statsig-darwin-arm64.tar.gz"
      sha256 "0271c94a81be75a5dc32845bbb700474339df43b7ee8825f79fe1dd97a019962"
    end
    on_intel do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.1.2/agent-statsig-darwin-amd64.tar.gz"
      sha256 "1022cef53f5c7e29bb99230ecb918e3febfd709a48c33148497cf362452a224d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.1.2/agent-statsig-linux-arm64.tar.gz"
      sha256 "d98821736ec98142c7d4c1fd37d5772e26e50c40209329208f1f7ecf79bfdc87"
    end
    on_intel do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.1.2/agent-statsig-linux-amd64.tar.gz"
      sha256 "8d3fea1bcdeec3cc52e39cd57e70ba6d4a2a261c3016dacb38cb882a656875a3"
    end
  end

  def install
    bin.install Dir["agent-statsig-*"].first => "agent-statsig"
  end

  test do
    assert_match "0.1.2", shell_output("#{bin}/agent-statsig --version")
    assert_match "Statsig", shell_output("#{bin}/agent-statsig --help")
  end
end
