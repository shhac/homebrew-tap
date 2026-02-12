class AgentMongo < Formula
  desc "Read-only MongoDB CLI for AI agents"
  homepage "https://github.com/shhac/agent-mongo"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.2.0/agent-mongo-darwin-arm64.tar.gz"
      sha256 "177713c4cdfc755884fadee84d4589db178cad593470da63f419457c98036c70"
    end
    on_intel do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.2.0/agent-mongo-darwin-x64.tar.gz"
      sha256 "c21db7172274af993d52b533cf3b319b925293bbb01ef020e395b2df8644f129"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.2.0/agent-mongo-linux-arm64.tar.gz"
      sha256 "0d36f7b9e224c2c1745210ee1ccc1d51b2c3b40de6f3403b612faff1b32fed1f"
    end
    on_intel do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.2.0/agent-mongo-linux-x64.tar.gz"
      sha256 "0783f007a8073c8ac23516c35c5ad223a70b002adb1b54ce94760b3774ac3f71"
    end
  end

  def install
    bin.install Dir["agent-mongo-*"].first => "agent-mongo"
  end

  test do
    assert_match "0.2.0", shell_output("#{bin}/agent-mongo --version")
    assert_match "MongoDB CLI", shell_output("#{bin}/agent-mongo --help")
  end
end
