class AgentMongo < Formula
  desc "Read-only MongoDB CLI for AI agents"
  homepage "https://github.com/shhac/agent-mongo"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.7.0/agent-mongo-darwin-arm64.tar.gz"
      sha256 "0c7c2363e11aba12d9fcd7d823991260342dac8fe9e42d873c758279a374aeb0"
    end
    on_intel do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.7.0/agent-mongo-darwin-x64.tar.gz"
      sha256 "7da28a831e5a9a01d810641f39abf1589ec6125bc5e74eb3b1d4266f27009cb1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.7.0/agent-mongo-linux-arm64.tar.gz"
      sha256 "141372523618537af22a374c3c0844f626ca2d17ebab409462760b6cb9247005"
    end
    on_intel do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.7.0/agent-mongo-linux-x64.tar.gz"
      sha256 "b35b746336cfaf97e94f2ffd2f75ec15e3e278b36cef497ec172a969b5e95b06"
    end
  end

  def install
    bin.install Dir["agent-mongo-*"].first => "agent-mongo"
  end

  test do
    assert_match "0.7.0", shell_output("#{bin}/agent-mongo --version")
    assert_match "MongoDB CLI", shell_output("#{bin}/agent-mongo --help")
  end
end
