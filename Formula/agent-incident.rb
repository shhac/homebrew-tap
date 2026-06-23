class AgentIncident < Formula
  desc "incident.io triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-incident"
  version "0.13.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-incident/releases/download/v0.13.1/agent-incident-darwin-arm64.tar.gz"
      sha256 "4091f89f949c9ea2cf020c7ca2fdce534ba006d1f8ba5e5418a3ea7510c0d7c2"
    end
    on_intel do
      url "https://github.com/shhac/agent-incident/releases/download/v0.13.1/agent-incident-darwin-amd64.tar.gz"
      sha256 "5c08ac1437b58c4acddf86110e8e9535e4416e493a07e87d171938b69a22f379"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-incident/releases/download/v0.13.1/agent-incident-linux-arm64.tar.gz"
      sha256 "f9e37fdc8a9f5a3fe6877bdd6567df2c72c0c0b3ab21ab44a5aad6004682baa8"
    end
    on_intel do
      url "https://github.com/shhac/agent-incident/releases/download/v0.13.1/agent-incident-linux-amd64.tar.gz"
      sha256 "1192e75adae0a0f6555844b9df98a3821e64e159e28b3e7c8013780243eb3f49"
    end
  end

  def install
    bin.install "agent-incident"
    # Installs shell completions via `agent-incident completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-incident", "completion")
  end

  test do
    assert_match "0.13.1", shell_output("#{bin}/agent-incident --version")
    assert_match "incident.io triage CLI", shell_output("#{bin}/agent-incident --help")
    assert_match "#compdef agent-incident", shell_output("#{bin}/agent-incident completion zsh")
  end
end
