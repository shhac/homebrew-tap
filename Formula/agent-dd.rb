class AgentDd < Formula
  desc "Datadog triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-dd"
  version "0.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.5.1/agent-dd-darwin-arm64.tar.gz"
      sha256 "24d7470175ce7dcccb8793d2a771472af828e41656253e3d7fb44cf45c166c78"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.5.1/agent-dd-darwin-amd64.tar.gz"
      sha256 "cc00e50d6b7db01c6e4801f345cf9ca9720ab4bf6453c57f3bb06a726bf11342"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.5.1/agent-dd-linux-arm64.tar.gz"
      sha256 "99453a0dc8b133f2663aa6cc5ce7cb060443671d32376ec3eeed495eed5cf2ee"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.5.1/agent-dd-linux-amd64.tar.gz"
      sha256 "f0665c29a875ed62c21b26c150c4dd273f0de98445df060069e33a1ee2b0af04"
    end
  end

  def install
    bin.install Dir["agent-dd-*"].first => "agent-dd"
  end

  test do
    assert_match "0.5.1", shell_output("#{bin}/agent-dd --version")
    assert_match "Datadog", shell_output("#{bin}/agent-dd --help")
  end
end
