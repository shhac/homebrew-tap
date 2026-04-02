class AgentMongo < Formula
  desc "Read-only MongoDB CLI for AI agents"
  homepage "https://github.com/shhac/agent-mongo"
  version "0.4.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.4.2/agent-mongo-darwin-arm64.tar.gz"
      sha256 "ac562232510d15aa50b737a2bc292e3dce5c7dee46c2fa1b181d49d8f8b5a603"
    end
    on_intel do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.4.2/agent-mongo-darwin-x64.tar.gz"
      sha256 "0efc39addbac6549eee853dd842a2f78385504b33e2bf829c51e0ef425adf977"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.4.2/agent-mongo-linux-arm64.tar.gz"
      sha256 "46b7bc1493b66f743bf078e2979456c929d3561ea33739e5e3c3af059bfb7afc"
    end
    on_intel do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.4.2/agent-mongo-linux-x64.tar.gz"
      sha256 "0119df454b85cf780b01036c4642bd371ad7e10c309f668f9e2846b12f28b3db"
    end
  end

  def install
    bin.install Dir["agent-mongo-*"].first => "agent-mongo"
  end

  test do
    assert_match "0.4.2", shell_output("#{bin}/agent-mongo --version")
    assert_match "MongoDB CLI", shell_output("#{bin}/agent-mongo --help")
  end
end
