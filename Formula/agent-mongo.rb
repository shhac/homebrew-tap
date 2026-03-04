class AgentMongo < Formula
  desc "Read-only MongoDB CLI for AI agents"
  homepage "https://github.com/shhac/agent-mongo"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.4.0/agent-mongo-darwin-arm64.tar.gz"
      sha256 "9dd563f88701209e3c30170b705a134d83934ef9fa7b1e1f9d0ec13b2efb34d1"
    end
    on_intel do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.4.0/agent-mongo-darwin-x64.tar.gz"
      sha256 "7c7a298cdb54218bb40ad7129596bba10669d541697f4a0f545bf1d7fca604af"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.4.0/agent-mongo-linux-arm64.tar.gz"
      sha256 "af812d5badecf93f26937ad088dcad972a5ac61130d160f90bf3da7012439c91"
    end
    on_intel do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.4.0/agent-mongo-linux-x64.tar.gz"
      sha256 "113cc01656c9dc44372b4885e55fa7bbe023b54746967829816a474523ca1095"
    end
  end

  def install
    bin.install Dir["agent-mongo-*"].first => "agent-mongo"
  end

  test do
    assert_match "0.4.0", shell_output("#{bin}/agent-mongo --version")
    assert_match "MongoDB CLI", shell_output("#{bin}/agent-mongo --help")
  end
end
