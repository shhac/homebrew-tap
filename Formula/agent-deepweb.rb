class AgentDeepweb < Formula
  desc "Authenticated HTTP CLI for AI agents (curl-with-auth)"
  homepage "https://github.com/shhac/agent-deepweb"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.3.0/agent-deepweb-darwin-arm64.tar.gz"
      sha256 "67e4232182fe5c43ba7a1a9b9ee543e796349f4f40a9799177245ede54418dca"
    end
    on_intel do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.3.0/agent-deepweb-darwin-amd64.tar.gz"
      sha256 "2a34d1f3084786e6b62ac503fc05828d5fe54e62a4222e2f34dfe31c1406de7e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.3.0/agent-deepweb-linux-arm64.tar.gz"
      sha256 "10dc590256ffb351e407cdad7be33b2b5654d41438f5cfe017bf67f87f97193e"
    end
    on_intel do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.3.0/agent-deepweb-linux-amd64.tar.gz"
      sha256 "f588c63854357654324ea45e082eef895a901921e47ddecd06872e58b6a6b7d9"
    end
  end

  def install
    bin.install Dir["agent-deepweb-*"].first => "agent-deepweb"
  end

  test do
    assert_match "0.3.0", shell_output("#{bin}/agent-deepweb --version")
    assert_match "Authenticated HTTP", shell_output("#{bin}/agent-deepweb --help")
  end
end
