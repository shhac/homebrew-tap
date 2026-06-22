class AgentIncident < Formula
  desc "incident.io triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-incident"
  version "0.13.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-incident/releases/download/v0.13.0/agent-incident-darwin-arm64.tar.gz"
      sha256 "bcb34ef09e7cf65213577c1dca1e32f6fa8d3c9ada454cd96b09935a1e42130f"
    end
    on_intel do
      url "https://github.com/shhac/agent-incident/releases/download/v0.13.0/agent-incident-darwin-amd64.tar.gz"
      sha256 "d55d05203f34f474daebe8edc92fc277d3f474c043fd1fc5831d947d94aa5d07"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-incident/releases/download/v0.13.0/agent-incident-linux-arm64.tar.gz"
      sha256 "98dc781b5ef6b07096bcdadf328c927fff226f2c00637e72964d045fc6709e38"
    end
    on_intel do
      url "https://github.com/shhac/agent-incident/releases/download/v0.13.0/agent-incident-linux-amd64.tar.gz"
      sha256 "f55d45efd3b162233fee7d45b81e4ed9a1c6dc0b7acd3a15b403b73e84893fe3"
    end
  end

  def install
    bin.install "agent-incident"
    # Installs shell completions via `agent-incident completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-incident", "completion")
  end

  test do
    assert_match "0.13.0", shell_output("#{bin}/agent-incident --version")
    assert_match "incident.io triage CLI", shell_output("#{bin}/agent-incident --help")
    assert_match "#compdef agent-incident", shell_output("#{bin}/agent-incident completion zsh")
  end
end
