class AgentMongo < Formula
  desc "Read-only MongoDB CLI for AI agents"
  homepage "https://github.com/shhac/agent-mongo"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.3.0/agent-mongo-darwin-arm64.tar.gz"
      sha256 "6616f331bd8f6a6e7b97cff6ac46d175590ca36c4bf21483505445a707b82faf"
    end
    on_intel do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.3.0/agent-mongo-darwin-x64.tar.gz"
      sha256 "9ca594f1fd177b21e7fb4b22aeeef27ef7a72ba7c3b3f51dee577d666ebbee92"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.3.0/agent-mongo-linux-arm64.tar.gz"
      sha256 "61c0bc93977226d7cb760f42db5df2b8021dad26b729ac74c5f3570d8f2f1075"
    end
    on_intel do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.3.0/agent-mongo-linux-x64.tar.gz"
      sha256 "a1d91169a4ff94e66022420e930636ed2df2f127ac723d560c0aba17fd260fa2"
    end
  end

  def install
    bin.install Dir["agent-mongo-*"].first => "agent-mongo"
  end

  test do
    assert_match "0.3.0", shell_output("#{bin}/agent-mongo --version")
    assert_match "MongoDB CLI", shell_output("#{bin}/agent-mongo --help")
  end
end
