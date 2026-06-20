class AgentStatsig < Formula
  desc "Statsig feature flag CLI for AI agents"
  homepage "https://github.com/shhac/agent-statsig"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.4.0/agent-statsig-darwin-arm64.tar.gz"
      sha256 "9f2f476a948c929f597e57815f98e4528c4d5dd76dc1071164c01e6559fa04d2"
    end
    on_intel do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.4.0/agent-statsig-darwin-amd64.tar.gz"
      sha256 "5cecb506c942f12be3b171e997c917dffd5f780f93dced1e4c9d22b488acec5d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.4.0/agent-statsig-linux-arm64.tar.gz"
      sha256 "891c04d2747fa7dfe10bff6c690e7f2ff1484a080f8d644282ebf8e896f7ec6a"
    end
    on_intel do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.4.0/agent-statsig-linux-amd64.tar.gz"
      sha256 "ff72d263c21753fd775cffe2fdfbec0a068ea57b45735e038b1eef2d59924dc3"
    end
  end

  def install
    bin.install Dir["agent-statsig-*"].first => "agent-statsig"
  end

  test do
    assert_match "0.4.0", shell_output("#{bin}/agent-statsig --version")
    assert_match "Statsig", shell_output("#{bin}/agent-statsig --help")
  end
end
