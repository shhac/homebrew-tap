class AgentIncident < Formula
  desc "incident.io triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-incident"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-incident/releases/download/v0.3.1/agent-incident-darwin-arm64.tar.gz"
      sha256 "5bb1b9c8af0c47714791f7fcde99c1744e418910ed2ef3b528d92f6a8cd2334b"
    end
    on_intel do
      url "https://github.com/shhac/agent-incident/releases/download/v0.3.1/agent-incident-darwin-amd64.tar.gz"
      sha256 "f9f94430410dd9d11d9ef22c13ced485ef0ea81da91c7a7d7e051598df564504"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-incident/releases/download/v0.3.1/agent-incident-linux-arm64.tar.gz"
      sha256 "6094849f3dcabf215f83223e01ca0b03bbe63eaeabb8708bf92865ac9cf3d44b"
    end
    on_intel do
      url "https://github.com/shhac/agent-incident/releases/download/v0.3.1/agent-incident-linux-amd64.tar.gz"
      sha256 "b8bdace86cf35c934aec46540e02d5db071d3c3cd65c174a648721673d48e147"
    end
  end

  def install
    bin.install Dir["agent-incident-*"].first => "agent-incident"
  end

  test do
    assert_match "0.3.1", shell_output("#{bin}/agent-incident --version")
    assert_match "incident", shell_output("#{bin}/agent-incident --help")
  end
end
