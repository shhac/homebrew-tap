class AgentDeepweb < Formula
  desc "Authenticated HTTP CLI for AI agents (curl-with-auth)"
  homepage "https://github.com/shhac/agent-deepweb"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.2.0/agent-deepweb-darwin-arm64.tar.gz"
      sha256 "bc462e4a1a8cf85ea23be4fea9ba43805b26e3fb2ff0bb1c58e8aed93a7e6615"
    end
    on_intel do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.2.0/agent-deepweb-darwin-amd64.tar.gz"
      sha256 "9c747c7c7d62cf20159b00044bfba8db1d596f0d6bdae8428b2ffdd480455af1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.2.0/agent-deepweb-linux-arm64.tar.gz"
      sha256 "81d9633a4785073c65bb792cce7599f184ec963d1735ae441b8a0cca35fe6b27"
    end
    on_intel do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.2.0/agent-deepweb-linux-amd64.tar.gz"
      sha256 "87da26660d3b3fba4233a83b78c619b3933415ae40934afde94519e77df2e51e"
    end
  end

  def install
    bin.install Dir["agent-deepweb-*"].first => "agent-deepweb"
  end

  test do
    assert_match "0.2.0", shell_output("#{bin}/agent-deepweb --version")
    assert_match "Authenticated HTTP", shell_output("#{bin}/agent-deepweb --help")
  end
end
