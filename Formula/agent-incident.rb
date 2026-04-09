class AgentIncident < Formula
  desc "incident.io triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-incident"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-incident/releases/download/v0.3.0/agent-incident-darwin-arm64.tar.gz"
      sha256 "239a86653e46fd8b65d455c9ad8d10db3bc58be8290b5ec7d0cfa412571ce084"
    end
    on_intel do
      url "https://github.com/shhac/agent-incident/releases/download/v0.3.0/agent-incident-darwin-amd64.tar.gz"
      sha256 "e129a8ffcc7e3284eb52fe82fcea8c3d104e98cec41dbedafc807c7204388a3d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-incident/releases/download/v0.3.0/agent-incident-linux-arm64.tar.gz"
      sha256 "7e62198335996688cbf848d1e8dfc122fad2200c046bb2bc0092a05c19692eac"
    end
    on_intel do
      url "https://github.com/shhac/agent-incident/releases/download/v0.3.0/agent-incident-linux-amd64.tar.gz"
      sha256 "a96313f5f0565c0cc4ba0520df20d546acac83d4e106584932c1531198176c55"
    end
  end

  def install
    bin.install Dir["agent-incident-*"].first => "agent-incident"
  end

  test do
    assert_match "0.3.0", shell_output("#{bin}/agent-incident --version")
    assert_match "incident", shell_output("#{bin}/agent-incident --help")
  end
end
