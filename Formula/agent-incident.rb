class AgentIncident < Formula
  desc "incident.io triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-incident"
  version "0.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-incident/releases/download/v0.12.0/agent-incident-darwin-arm64.tar.gz"
      sha256 "91f8101ce2025f53234742540e5c7ec65c8eb4fc0e4eff1f01934ab6a7b11b9a"
    end
    on_intel do
      url "https://github.com/shhac/agent-incident/releases/download/v0.12.0/agent-incident-darwin-amd64.tar.gz"
      sha256 "d0ad0d55ce332487045343e486641c4bf34e07ed4778b652610c2ab497425a3e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-incident/releases/download/v0.12.0/agent-incident-linux-arm64.tar.gz"
      sha256 "0774935b073a6a53f6313eed7c9250baaa9a29aa7c49159d352b00e91a769b7a"
    end
    on_intel do
      url "https://github.com/shhac/agent-incident/releases/download/v0.12.0/agent-incident-linux-amd64.tar.gz"
      sha256 "373a68af01a9cb400a1bc1d3d3ca26929909151434502ccf420ea9c9bc28434f"
    end
  end

  def install
    bin.install "agent-incident"
    # Installs shell completions via `agent-incident completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-incident", "completion")
  end

  test do
    assert_match "0.12.0", shell_output("#{bin}/agent-incident --version")
    assert_match "incident.io triage CLI", shell_output("#{bin}/agent-incident --help")
    assert_match "#compdef agent-incident", shell_output("#{bin}/agent-incident completion zsh")
  end
end
