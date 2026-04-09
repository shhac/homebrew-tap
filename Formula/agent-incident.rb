class AgentIncident < Formula
  desc "incident.io triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-incident"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-incident/releases/download/v0.1.1/agent-incident-darwin-arm64.tar.gz"
      sha256 "f53addbf30a3829ed46e2bca96961218e004072462f601eaf0498affd212c23f"
    end
    on_intel do
      url "https://github.com/shhac/agent-incident/releases/download/v0.1.1/agent-incident-darwin-amd64.tar.gz"
      sha256 "9cb030f4ed49f932cd17c2c8ef5c1b833421cab7630d633fde8e3aeb67ce42ad"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-incident/releases/download/v0.1.1/agent-incident-linux-arm64.tar.gz"
      sha256 "3fe9b48b738c0ce13ffb2cf79d2b36e30f31410da88f4f8fe2f1a8b99ca65372"
    end
    on_intel do
      url "https://github.com/shhac/agent-incident/releases/download/v0.1.1/agent-incident-linux-amd64.tar.gz"
      sha256 "552843a3020f7abcffab32b3cd83ffc3f585ab83274b52df84cb2891546a3036"
    end
  end

  def install
    bin.install Dir["agent-incident-*"].first => "agent-incident"
  end

  test do
    assert_match "0.1.1", shell_output("#{bin}/agent-incident --version")
    assert_match "incident", shell_output("#{bin}/agent-incident --help")
  end
end
