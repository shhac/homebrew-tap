class AgentMongo < Formula
  desc "Read-only MongoDB CLI for AI agents"
  homepage "https://github.com/shhac/agent-mongo"
  version "0.8.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.8.2/agent-mongo-darwin-arm64.tar.gz"
      sha256 "f4d8192ceb0fed45d3c51cd3e91864ff4cec9e541395720c65e55f4faa3dc063"
    end
    on_intel do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.8.2/agent-mongo-darwin-x64.tar.gz"
      sha256 "08e9a0413f794b8c011c484dc444fee5dc2eef09850e40937c5ffe5defb34269"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.8.2/agent-mongo-linux-arm64.tar.gz"
      sha256 "e742720dbd5aca6ab0120d3c29a4bf435a419671c81bfd990d009941978f77a9"
    end
    on_intel do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.8.2/agent-mongo-linux-x64.tar.gz"
      sha256 "1568b3fb885d2b4230563cacef9d96885bf21561dde5d77da8402621f997fffe"
    end
  end

  def install
    bin.install Dir["agent-mongo-*"].first => "agent-mongo"
  end

  test do
    assert_match "0.8.2", shell_output("#{bin}/agent-mongo --version")
    assert_match "MongoDB CLI", shell_output("#{bin}/agent-mongo --help")
  end
end
