class AgentDeepweb < Formula
  desc "Authenticated HTTP CLI for AI agents (curl-with-auth)"
  homepage "https://github.com/shhac/agent-deepweb"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.6.0/agent-deepweb-darwin-arm64.tar.gz"
      sha256 "f1ec453ea16d85fe90f613c8a3d860ef1514c30a96407df5f54c9cd3e071d4ad"
    end
    on_intel do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.6.0/agent-deepweb-darwin-amd64.tar.gz"
      sha256 "af660fc780c9026fdd53fdaa0731e208a94f034124a93bea1024ad1068c622f1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.6.0/agent-deepweb-linux-arm64.tar.gz"
      sha256 "a043150d942e17797af3c7e92998bb4302cd6ff8c7b99c7d130f990b4ab8cad3"
    end
    on_intel do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.6.0/agent-deepweb-linux-amd64.tar.gz"
      sha256 "9be95cb5c5e8b1b248b1ee532de114e25e78a033a8ed0f87b909292513ce7ac9"
    end
  end

  def install
    bin.install Dir["agent-deepweb-*"].first => "agent-deepweb"
  end

  test do
    assert_match "0.6.0", shell_output("#{bin}/agent-deepweb --version")
    assert_match "Authenticated HTTP", shell_output("#{bin}/agent-deepweb --help")
  end
end
