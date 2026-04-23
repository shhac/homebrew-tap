class AgentDeepweb < Formula
  desc "Authenticated HTTP CLI for AI agents (curl-with-auth)"
  homepage "https://github.com/shhac/agent-deepweb"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.1.0/agent-deepweb-darwin-arm64.tar.gz"
      sha256 "f2c2f00b18fe05029dc8eb6ec73ff76ecb5d7828880aaae7825326f81b2192bb"
    end
    on_intel do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.1.0/agent-deepweb-darwin-amd64.tar.gz"
      sha256 "281cdc5bb1c93a9fe5419285cdc5d57ee4cac09ee6e7b30f85f2e5f37870e9db"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.1.0/agent-deepweb-linux-arm64.tar.gz"
      sha256 "751bdab1f558559ae4bbf0f6b2644d45b2572f7356e62ed48c8dcc62ecb521d6"
    end
    on_intel do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.1.0/agent-deepweb-linux-amd64.tar.gz"
      sha256 "071b31780d38d09ac4d174456bc92a45641d0c40688a6028d39fbca4fe75d6df"
    end
  end

  def install
    bin.install Dir["agent-deepweb-*"].first => "agent-deepweb"
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/agent-deepweb --version")
    assert_match "Authenticated HTTP", shell_output("#{bin}/agent-deepweb --help")
  end
end
