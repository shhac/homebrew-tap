class AgentDeepweb < Formula
  desc "Authenticated HTTP CLI for AI agents (curl-with-auth)"
  homepage "https://github.com/shhac/agent-deepweb"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.5.0/agent-deepweb-darwin-arm64.tar.gz"
      sha256 "9464a4e8865ec140e21b149e0a51f10008c3ac253be918c896f197020739c578"
    end
    on_intel do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.5.0/agent-deepweb-darwin-amd64.tar.gz"
      sha256 "25e0af4333aa98790c1b2b6e6fe4d34a48682642970b051b2b39044ee8848d35"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.5.0/agent-deepweb-linux-arm64.tar.gz"
      sha256 "9de52cffed58021df8919bd78b32ae839aa536fd74f17e4b88e78c05efa22596"
    end
    on_intel do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.5.0/agent-deepweb-linux-amd64.tar.gz"
      sha256 "5da585997240e931550e62f92a89ae56dcd4b1d1012da4e7d35ce0f6813146f9"
    end
  end

  def install
    bin.install Dir["agent-deepweb-*"].first => "agent-deepweb"
  end

  test do
    assert_match "0.5.0", shell_output("#{bin}/agent-deepweb --version")
    assert_match "Authenticated HTTP", shell_output("#{bin}/agent-deepweb --help")
  end
end
