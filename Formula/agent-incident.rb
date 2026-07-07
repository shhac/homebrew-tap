class AgentIncident < Formula
  desc "incident.io triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-incident"
  version "0.15.1"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-incident/releases/download/v0.15.1/agent-incident-darwin-arm64.tar.gz"
      sha256 "d44cef4e85220bb85a9708f4244f8d7c7000bc1e678e3c69b34f4a940dcbaccb"
    end
    on_intel do
      url "https://github.com/shhac/agent-incident/releases/download/v0.15.1/agent-incident-darwin-amd64.tar.gz"
      sha256 "8f28051d925968507245d1a3c3ef8e8e7226fc64b9ef90017d6084570dba6540"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-incident/releases/download/v0.15.1/agent-incident-linux-arm64.tar.gz"
      sha256 "bc21f879bd6c4888f0f24dd556bb02244ade4a10bd92b55dc1df0bb4c9e2604b"
    end
    on_intel do
      url "https://github.com/shhac/agent-incident/releases/download/v0.15.1/agent-incident-linux-amd64.tar.gz"
      sha256 "c612b8d821079d4312d5b1d7f9a082ae5ee95aae6712c44967bd2e0886c35e8c"
    end
  end

  def install
    bin.install "agent-incident"
    # Installs shell completions via `agent-incident completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-incident", "completion")
  end

  test do
    assert_match "0.15.1", shell_output("#{bin}/agent-incident --version")
    assert_match "incident.io triage CLI", shell_output("#{bin}/agent-incident --help")
    assert_match "#compdef agent-incident", shell_output("#{bin}/agent-incident completion zsh")
  end
end
