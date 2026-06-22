class AgentIncident < Formula
  desc "incident.io triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-incident"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-incident/releases/download/v0.9.0/agent-incident-darwin-arm64.tar.gz"
      sha256 "a14c91d744e8a84f54854038dca0345cd79ede855e21fa21f3621c3bd486a678"
    end
    on_intel do
      url "https://github.com/shhac/agent-incident/releases/download/v0.9.0/agent-incident-darwin-amd64.tar.gz"
      sha256 "6758c31b08acd26b3c4af68e5ea494733b195fd3bf7c0ba8b708c0482d94025a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-incident/releases/download/v0.9.0/agent-incident-linux-arm64.tar.gz"
      sha256 "91d17dbbdadc859dd18e2585857ac80f37c9ea160b3fb5250131600121155611"
    end
    on_intel do
      url "https://github.com/shhac/agent-incident/releases/download/v0.9.0/agent-incident-linux-amd64.tar.gz"
      sha256 "1149f734f0266d95627fa7b4d69dfcfdc91eccc60e08259b1507bb24f8e68bf3"
    end
  end

  def install
    bin.install "agent-incident"
    # Installs shell completions via `agent-incident completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-incident", "completion")
  end

  test do
    assert_match "0.9.0", shell_output("#{bin}/agent-incident --version")
    assert_match "incident.io triage CLI", shell_output("#{bin}/agent-incident --help")
    assert_match "#compdef agent-incident", shell_output("#{bin}/agent-incident completion zsh")
  end
end
