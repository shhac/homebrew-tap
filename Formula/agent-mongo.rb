class AgentMongo < Formula
  desc "Read-only MongoDB CLI for AI agents"
  homepage "https://github.com/shhac/agent-mongo"
  version "0.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.4.1/agent-mongo-darwin-arm64.tar.gz"
      sha256 "a1a714c9a12b2859a1e605c4ba38101b4b7651bff098dd5e351b3b10b64513d2"
    end
    on_intel do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.4.1/agent-mongo-darwin-x64.tar.gz"
      sha256 "4b0d4071c766ef1328c0d1d576652ee04e03879315c9b13f4303e7f0e9089b60"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.4.1/agent-mongo-linux-arm64.tar.gz"
      sha256 "e426c758bca67af678f9d1e7a52468c8cc4fe0a930aafec47b3a2e2e56ae195e"
    end
    on_intel do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.4.1/agent-mongo-linux-x64.tar.gz"
      sha256 "4d8dc911d7e972372eccdc399306220f04cddd40e6f09fb1d38f94208474e4b1"
    end
  end

  def install
    bin.install Dir["agent-mongo-*"].first => "agent-mongo"
  end

  test do
    assert_match "0.4.1", shell_output("#{bin}/agent-mongo --version")
    assert_match "MongoDB CLI", shell_output("#{bin}/agent-mongo --help")
  end
end
