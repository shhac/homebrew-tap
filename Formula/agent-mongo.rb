class AgentMongo < Formula
  desc "Read-only MongoDB CLI for AI agents"
  homepage "https://github.com/shhac/agent-mongo"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.6.0/agent-mongo-darwin-arm64.tar.gz"
      sha256 "e0228e2a49aab263a317c9816c769eab4e8232604767f2a70be0f0e1287ce84d"
    end
    on_intel do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.6.0/agent-mongo-darwin-x64.tar.gz"
      sha256 "07e99f1006e3f53185b199f3e682151d383d83702d27e0d7bd912ebf730b21b5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.6.0/agent-mongo-linux-arm64.tar.gz"
      sha256 "5d9ba52088299393a813ba91f21acbfa35d0d8c87afe99fa1ff90f4a1a1d804b"
    end
    on_intel do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.6.0/agent-mongo-linux-x64.tar.gz"
      sha256 "0236ba971b5127ce9b11ab927feb5d9fe1bd24282f49511dc8dbc3ee97844f52"
    end
  end

  def install
    bin.install Dir["agent-mongo-*"].first => "agent-mongo"
  end

  test do
    assert_match "0.6.0", shell_output("#{bin}/agent-mongo --version")
    assert_match "MongoDB CLI", shell_output("#{bin}/agent-mongo --help")
  end
end
