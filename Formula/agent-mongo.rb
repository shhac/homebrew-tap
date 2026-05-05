class AgentMongo < Formula
  desc "Read-only MongoDB CLI for AI agents"
  homepage "https://github.com/shhac/agent-mongo"
  version "0.8.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.8.1/agent-mongo-darwin-arm64.tar.gz"
      sha256 "ea142a2b14117d51a308360ea385094052eb144abdb2082588df8b8ef0b9bd10"
    end
    on_intel do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.8.1/agent-mongo-darwin-x64.tar.gz"
      sha256 "f0a21700262b5e3d3fb645a709f22cd53371e934d244f64d3cf29173e6e05fbd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.8.1/agent-mongo-linux-arm64.tar.gz"
      sha256 "1fd84dba476025b282d6b3515a67cf706f48d29237822e2919e39a5b7a4b7ed1"
    end
    on_intel do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.8.1/agent-mongo-linux-x64.tar.gz"
      sha256 "ea370546806c6dafee59a928c817990a0583a85c502595f6894f82df34248385"
    end
  end

  def install
    bin.install Dir["agent-mongo-*"].first => "agent-mongo"
  end

  test do
    assert_match "0.8.1", shell_output("#{bin}/agent-mongo --version")
    assert_match "MongoDB CLI", shell_output("#{bin}/agent-mongo --help")
  end
end
