class AgentIncident < Formula
  desc "incident.io triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-incident"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-incident/releases/download/v0.4.0/agent-incident-darwin-arm64.tar.gz"
      sha256 "a68d74e08a9021fa204e4519b5db8fc9841b959f9cd947fc3b615a564ed20922"
    end
    on_intel do
      url "https://github.com/shhac/agent-incident/releases/download/v0.4.0/agent-incident-darwin-amd64.tar.gz"
      sha256 "c8f62ecbcc4894efb5da0a6659a0d13266be91b6f8c6adafadc614b672603b13"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-incident/releases/download/v0.4.0/agent-incident-linux-arm64.tar.gz"
      sha256 "bc7f6bfd8f1ec225afa8eda1ced99e1c47debdd21abf46bbfc4e1c3bcf25f5f2"
    end
    on_intel do
      url "https://github.com/shhac/agent-incident/releases/download/v0.4.0/agent-incident-linux-amd64.tar.gz"
      sha256 "eba5f4dda446330e13b74102da1384a1fd29d7a9036634d76ee82cdcb509ebfc"
    end
  end

  def install
    bin.install Dir["agent-incident-*"].first => "agent-incident"
  end

  test do
    assert_match "0.4.0", shell_output("#{bin}/agent-incident --version")
    assert_match "incident", shell_output("#{bin}/agent-incident --help")
  end
end
