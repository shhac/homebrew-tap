class AgentMongo < Formula
  desc "Read-only MongoDB CLI for AI agents"
  homepage "https://github.com/shhac/agent-mongo"
  version "0.8.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.8.4/agent-mongo-darwin-arm64.tar.gz"
      sha256 "bcdb5d22621f605b5b6ebc1b6d35e80a032e0bffa208e472abd65a779df987bf"
    end
    on_intel do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.8.4/agent-mongo-darwin-x64.tar.gz"
      sha256 "404a7846c49cebf020c8b82a22f992994f1439488822a68c9e188371b7fa3964"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.8.4/agent-mongo-linux-arm64.tar.gz"
      sha256 "7cde955385abd6cad328ea9f5abbbabd9ea44d558cfafc3903b7767d2357cc16"
    end
    on_intel do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.8.4/agent-mongo-linux-x64.tar.gz"
      sha256 "7d7a00fce1de06f5c0478b85525e3c584741116e447c5984e0b06df64f6a0f76"
    end
  end

  def install
    bin.install Dir["agent-mongo-*"].first => "agent-mongo"
  end

  test do
    assert_match "0.8.4", shell_output("#{bin}/agent-mongo --version")
    assert_match "MongoDB CLI", shell_output("#{bin}/agent-mongo --help")
  end
end
