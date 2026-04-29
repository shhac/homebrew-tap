class AgentDd < Formula
  desc "Datadog triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-dd"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.4.0/agent-dd-darwin-arm64.tar.gz"
      sha256 "98d6f48fd75f1982694e50b9ce0e3b59ad08488e573c2476126b8c96a05aee6d"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.4.0/agent-dd-darwin-amd64.tar.gz"
      sha256 "5f8cfa9da37ec901af0220828391a0967bac15a9f9994a243eb233c4c7662340"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.4.0/agent-dd-linux-arm64.tar.gz"
      sha256 "7f2d38df192495fa8ecb67d08483e535d9262dca95011f5a14375517169c67de"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.4.0/agent-dd-linux-amd64.tar.gz"
      sha256 "11a24347211bd3054c4d3a690a7d6aee861af293cb446ec831ddc2df073642cd"
    end
  end

  def install
    bin.install Dir["agent-dd-*"].first => "agent-dd"
  end

  test do
    assert_match "0.4.0", shell_output("#{bin}/agent-dd version")
    assert_match "Datadog", shell_output("#{bin}/agent-dd --help")
  end
end
