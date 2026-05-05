class AgentMongo < Formula
  desc "Read-only MongoDB CLI for AI agents"
  homepage "https://github.com/shhac/agent-mongo"
  version "0.8.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.8.3/agent-mongo-darwin-arm64.tar.gz"
      sha256 "1b7037b4ce3176f733b8b36fbd29e173e7da3b65ecab8371a010bab817e7d094"
    end
    on_intel do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.8.3/agent-mongo-darwin-x64.tar.gz"
      sha256 "3f85236051f4b33429965676ed6f6069582fc5c2908b0b580f76cce9621bed30"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.8.3/agent-mongo-linux-arm64.tar.gz"
      sha256 "0a24f4f709710be2ad222a3160095d6c2caa6ef9b7fedd0c29f5eca02dcb3828"
    end
    on_intel do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.8.3/agent-mongo-linux-x64.tar.gz"
      sha256 "0f25217421d3976896b8d732befc3216796efd1ac94096ef1296e80cf726162b"
    end
  end

  def install
    bin.install Dir["agent-mongo-*"].first => "agent-mongo"
  end

  test do
    assert_match "0.8.3", shell_output("#{bin}/agent-mongo --version")
    assert_match "MongoDB CLI", shell_output("#{bin}/agent-mongo --help")
  end
end
