class AgentIncident < Formula
  desc "incident.io triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-incident"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-incident/releases/download/v0.2.0/agent-incident-darwin-arm64.tar.gz"
      sha256 "060acea1b79e867b9e5d8f1a53c2dac8c139e2b4f8dc6fa783d23c2ad5216b5c"
    end
    on_intel do
      url "https://github.com/shhac/agent-incident/releases/download/v0.2.0/agent-incident-darwin-amd64.tar.gz"
      sha256 "e005165476d4cc269a08c10f1dbffd8a27e43e2932a0809a484e2152ace4a34f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-incident/releases/download/v0.2.0/agent-incident-linux-arm64.tar.gz"
      sha256 "4727fbf339951d9a290c1dabd9a659534e00a1a988aefc71777f3ef8ae698ec6"
    end
    on_intel do
      url "https://github.com/shhac/agent-incident/releases/download/v0.2.0/agent-incident-linux-amd64.tar.gz"
      sha256 "28b612a3a6ecc6573ca04df907fe14ab18d40e721558e32135c7c28166e4b506"
    end
  end

  def install
    bin.install Dir["agent-incident-*"].first => "agent-incident"
  end

  test do
    assert_match "0.2.0", shell_output("#{bin}/agent-incident --version")
    assert_match "incident", shell_output("#{bin}/agent-incident --help")
  end
end
