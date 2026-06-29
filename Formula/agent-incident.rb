class AgentIncident < Formula
  desc "incident.io triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-incident"
  version "0.15.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-incident/releases/download/v0.15.0/agent-incident-darwin-arm64.tar.gz"
      sha256 "45af283b0652fbdd326ecc1451c2eec873ee39d0151ebc12fffbfe9bdf5dc579"
    end
    on_intel do
      url "https://github.com/shhac/agent-incident/releases/download/v0.15.0/agent-incident-darwin-amd64.tar.gz"
      sha256 "fa6bdafda49b7224a53b7af6c98760e807544c49caa76eee746be3f5803cc311"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-incident/releases/download/v0.15.0/agent-incident-linux-arm64.tar.gz"
      sha256 "139a1fd0c6e577cea90ed58c13f95e42b639e241c6caa7b01dccc50765487ca9"
    end
    on_intel do
      url "https://github.com/shhac/agent-incident/releases/download/v0.15.0/agent-incident-linux-amd64.tar.gz"
      sha256 "8ba224727aa255fc3dbe314fae7c656bda845dd41bb483a55ef0f261cfe9da1f"
    end
  end

  def install
    bin.install "agent-incident"
    # Installs shell completions via `agent-incident completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-incident", "completion")
  end

  test do
    assert_match "0.15.0", shell_output("#{bin}/agent-incident --version")
    assert_match "incident.io triage CLI", shell_output("#{bin}/agent-incident --help")
    assert_match "#compdef agent-incident", shell_output("#{bin}/agent-incident completion zsh")
  end
end
