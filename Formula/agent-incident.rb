class AgentIncident < Formula
  desc "incident.io triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-incident"
  version "0.14.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-incident/releases/download/v0.14.0/agent-incident-darwin-arm64.tar.gz"
      sha256 "8ca02347ffed2a63ced38014926af7860b5a9bf251d285e6a3ba35913ab8c63e"
    end
    on_intel do
      url "https://github.com/shhac/agent-incident/releases/download/v0.14.0/agent-incident-darwin-amd64.tar.gz"
      sha256 "fd3a56d2814e91adac3c9a1b10dc6554310f53de5268c3d4a0da15be5d776a3d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-incident/releases/download/v0.14.0/agent-incident-linux-arm64.tar.gz"
      sha256 "9e381d8912cf9ccf36d8de80f414bb923450c1f2f13743fc9af5170770664ac5"
    end
    on_intel do
      url "https://github.com/shhac/agent-incident/releases/download/v0.14.0/agent-incident-linux-amd64.tar.gz"
      sha256 "207f46a6c0044b4240086bec32a1ccd0010b71b5a4119752af8199cbf89fa5da"
    end
  end

  def install
    bin.install "agent-incident"
    # Installs shell completions via `agent-incident completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-incident", "completion")
  end

  test do
    assert_match "0.14.0", shell_output("#{bin}/agent-incident --version")
    assert_match "incident.io triage CLI", shell_output("#{bin}/agent-incident --help")
    assert_match "#compdef agent-incident", shell_output("#{bin}/agent-incident completion zsh")
  end
end
