class AgentMongo < Formula
  desc "Read-only MongoDB CLI for AI agents"
  homepage "https://github.com/shhac/agent-mongo"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.8.0/agent-mongo-darwin-arm64.tar.gz"
      sha256 "80ab9a035ad62394c5813033dbb817e804bb00f11e05c811ef18e46da3f44be6"
    end
    on_intel do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.8.0/agent-mongo-darwin-x64.tar.gz"
      sha256 "5dde97806dd29356b840ef1fb245415baae92f4088892c30fceb2f5a0771f685"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.8.0/agent-mongo-linux-arm64.tar.gz"
      sha256 "24ca97901f8feb6e071a91a64b6c5388136cf7291db1a881ccde41734f58f724"
    end
    on_intel do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.8.0/agent-mongo-linux-x64.tar.gz"
      sha256 "cfccc32acd30a0e06948e0df85a41acf1eed1d820e4abfa5ec2c93c7c37b6fc4"
    end
  end

  def install
    bin.install Dir["agent-mongo-*"].first => "agent-mongo"
  end

  test do
    assert_match "0.8.0", shell_output("#{bin}/agent-mongo --help")
    assert_match "MongoDB CLI", shell_output("#{bin}/agent-mongo --help")
  end
end
