class AgentStatsig < Formula
  desc "Statsig feature flag CLI for AI agents"
  homepage "https://github.com/shhac/agent-statsig"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.2.0/agent-statsig-darwin-arm64.tar.gz"
      sha256 "cfa98e74cfdc5f02ac4a4edc5dd78888d820d908698e38a888d886c4d957292a"
    end
    on_intel do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.2.0/agent-statsig-darwin-amd64.tar.gz"
      sha256 "880540a10656dac0a3d758b2fc6a401ceac6f1252be43222beb78923954badd2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.2.0/agent-statsig-linux-arm64.tar.gz"
      sha256 "1d3cfc2d8567c45c7a3dcb830f61838e92a708ec0716d5499cab1dc3dbc75430"
    end
    on_intel do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.2.0/agent-statsig-linux-amd64.tar.gz"
      sha256 "07becf605f3088c7968fc286b2a6053f17c6c3596a68deb6ee9d756737f0b3ef"
    end
  end

  def install
    bin.install Dir["agent-statsig-*"].first => "agent-statsig"
  end

  test do
    assert_match "0.2.0", shell_output("#{bin}/agent-statsig --version")
    assert_match "Statsig", shell_output("#{bin}/agent-statsig --help")
  end
end
