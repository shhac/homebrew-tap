class AgentIncident < Formula
  desc "incident.io triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-incident"
  version "0.16.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-incident/releases/download/v0.16.0/agent-incident-darwin-arm64.tar.gz"
      sha256 "38e8762889b43208bb7cd9cfbbf5431ef94ca87a7d28c046ed0b76436885dbc9"
    end
    on_intel do
      url "https://github.com/shhac/agent-incident/releases/download/v0.16.0/agent-incident-darwin-amd64.tar.gz"
      sha256 "de323e9a55944d5c2ee8459591b6c5a8c9bee2afe18f3263aec705ec70896386"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-incident/releases/download/v0.16.0/agent-incident-linux-arm64.tar.gz"
      sha256 "77e694d4f3b81865a4ab0347f487f6d4e1642c66b74842d063a28021e21a1fbe"
    end
    on_intel do
      url "https://github.com/shhac/agent-incident/releases/download/v0.16.0/agent-incident-linux-amd64.tar.gz"
      sha256 "a9064f96261ff22183ced9f524519e537982200451bbe7d9489d70f31662eb77"
    end
  end

  def install
    bin.install "agent-incident"
    # Installs shell completions via `agent-incident completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-incident", "completion")
  end

  test do
    assert_match "0.16.0", shell_output("#{bin}/agent-incident --version")
    assert_match "incident.io triage CLI", shell_output("#{bin}/agent-incident --help")
    assert_match "#compdef agent-incident", shell_output("#{bin}/agent-incident completion zsh")
  end
end
