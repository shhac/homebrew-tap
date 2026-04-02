class AgentMongo < Formula
  desc "Read-only MongoDB CLI for AI agents"
  homepage "https://github.com/shhac/agent-mongo"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.5.0/agent-mongo-darwin-arm64.tar.gz"
      sha256 "9b3e1178c1206f3c5aca312ef6de78c2c1a9161617ade2b009d56b845bb2057c"
    end
    on_intel do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.5.0/agent-mongo-darwin-x64.tar.gz"
      sha256 "b026cfc031b58e8630fdae0d7329023f70d36c2f6318669298946c92b186de5d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.5.0/agent-mongo-linux-arm64.tar.gz"
      sha256 "6f19e122ca6aa59f4431ed2e48bafc01a166417caa8bdd2dbc85420438e8bdab"
    end
    on_intel do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.5.0/agent-mongo-linux-x64.tar.gz"
      sha256 "4c287854edcde3e99983b2057abd534f79655b3efbbe8e8d10557547b47efb0a"
    end
  end

  def install
    bin.install Dir["agent-mongo-*"].first => "agent-mongo"
  end

  test do
    assert_match "0.5.0", shell_output("#{bin}/agent-mongo --version")
    assert_match "MongoDB CLI", shell_output("#{bin}/agent-mongo --help")
  end
end
