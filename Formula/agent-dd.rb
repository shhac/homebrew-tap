class AgentDd < Formula
  desc "Datadog triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-dd"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.5.0/agent-dd-darwin-arm64.tar.gz"
      sha256 "14793dc049a68fd8b1e0ffbc386c927b621fe23b91aab9e25f920c6128fb6329"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.5.0/agent-dd-darwin-amd64.tar.gz"
      sha256 "df11c5c78ca7fd6cd916be7d38e5b8020142114e3e8924d90801e2d027ad1daa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.5.0/agent-dd-linux-arm64.tar.gz"
      sha256 "077778d65816dc2823d4a73d010508014be935c5e8ebd3da5ea6242d5ce97a1e"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.5.0/agent-dd-linux-amd64.tar.gz"
      sha256 "5dfa048b1b7466ef16d026343683f55d47dc4c8042b0ae4922533e665574ac75"
    end
  end

  def install
    bin.install Dir["agent-dd-*"].first => "agent-dd"
  end

  test do
    assert_match "0.5.0", shell_output("#{bin}/agent-dd version")
    assert_match "Datadog", shell_output("#{bin}/agent-dd --help")
  end
end
