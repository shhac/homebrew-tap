class AgentMongo < Formula
  desc "Read-only MongoDB CLI for AI agents"
  homepage "https://github.com/shhac/agent-mongo"
  version "0.8.5"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.8.5/agent-mongo-darwin-arm64.tar.gz"
      sha256 "d69d9d4059fdc7faa503594724524bb3258a2522fafb2f0af71b451e4f95bbee"
    end
    on_intel do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.8.5/agent-mongo-darwin-x64.tar.gz"
      sha256 "90e85abf38a8f655c9987ff1cdf0e875a30fa469c5b3c55934ad9a8c9a8ae22c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.8.5/agent-mongo-linux-arm64.tar.gz"
      sha256 "2431dc4cb0d1f490b5fbda0aa2b7f47396cae5834261a4b28a1b8b0bdd303e4e"
    end
    on_intel do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.8.5/agent-mongo-linux-x64.tar.gz"
      sha256 "ea82d844919f87986f7cc378daff880484b72252ffa5ce6345e832cb0059ccac"
    end
  end

  def install
    bin.install Dir["agent-mongo-*"].first => "agent-mongo"
  end

  test do
    assert_match "0.8.5", shell_output("#{bin}/agent-mongo --version")
    assert_match "MongoDB CLI", shell_output("#{bin}/agent-mongo --help")
  end
end
