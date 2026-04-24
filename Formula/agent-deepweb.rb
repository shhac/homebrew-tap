class AgentDeepweb < Formula
  desc "Authenticated HTTP CLI for AI agents (curl-with-auth)"
  homepage "https://github.com/shhac/agent-deepweb"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.4.0/agent-deepweb-darwin-arm64.tar.gz"
      sha256 "f39d6bd7c628309e12347f9e1889847537e383d7729a48cd0f45052fef7ab8da"
    end
    on_intel do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.4.0/agent-deepweb-darwin-amd64.tar.gz"
      sha256 "8d1a5446f43cc1b5e4c8d23da3c18828f4aaf9cf3228c06984b713dd56f92469"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.4.0/agent-deepweb-linux-arm64.tar.gz"
      sha256 "376de30dde2bf730bbf58c7e5856f0ef6a2682025cabe1755571497adf436342"
    end
    on_intel do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.4.0/agent-deepweb-linux-amd64.tar.gz"
      sha256 "f42d5a487273e25833f20e30eea698906afb4bdd1d13653533aa6f0d0c90641a"
    end
  end

  def install
    bin.install Dir["agent-deepweb-*"].first => "agent-deepweb"
  end

  test do
    assert_match "0.4.0", shell_output("#{bin}/agent-deepweb --version")
    assert_match "Authenticated HTTP", shell_output("#{bin}/agent-deepweb --help")
  end
end
