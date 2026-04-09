class AgentIncident < Formula
  desc "incident.io triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-incident"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-incident/releases/download/v0.1.0/agent-incident-darwin-arm64.tar.gz"
      sha256 "093c736810e64dce8c9fa79d73f8604eaaa21447eafe13d318f86599419ea816"
    end
    on_intel do
      url "https://github.com/shhac/agent-incident/releases/download/v0.1.0/agent-incident-darwin-amd64.tar.gz"
      sha256 "d7c9a93fd565fec397ff4840be83827a50e220ca7a41b55cf1b80207d95509db"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-incident/releases/download/v0.1.0/agent-incident-linux-arm64.tar.gz"
      sha256 "2993caca459aa6c0693786bf9173e52e2c72d792955e4ae1c9b049991c41333c"
    end
    on_intel do
      url "https://github.com/shhac/agent-incident/releases/download/v0.1.0/agent-incident-linux-amd64.tar.gz"
      sha256 "0b3c0c8510c38f491861632bf7f19a786aeb954916869f9611ee993ef8967d36"
    end
  end

  def install
    bin.install Dir["agent-incident-*"].first => "agent-incident"
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/agent-incident --version")
    assert_match "incident", shell_output("#{bin}/agent-incident --help")
  end
end
