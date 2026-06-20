class AgentIncident < Formula
  desc "incident.io triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-incident"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-incident/releases/download/v0.5.0/agent-incident-darwin-arm64.tar.gz"
      sha256 "87b25d09bdaefc7a92e61b905bad6e6c17017300df86e5e03a133bbc3343a94e"
    end
    on_intel do
      url "https://github.com/shhac/agent-incident/releases/download/v0.5.0/agent-incident-darwin-amd64.tar.gz"
      sha256 "992df9550493184e605725b51be856ec29b07ac05dc5e7562fe2920863091ed0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-incident/releases/download/v0.5.0/agent-incident-linux-arm64.tar.gz"
      sha256 "d0833fc43a26094ffc67d2f37e8c917c4235e8cd1076b9263365b78e8f2f4aac"
    end
    on_intel do
      url "https://github.com/shhac/agent-incident/releases/download/v0.5.0/agent-incident-linux-amd64.tar.gz"
      sha256 "6a0d3e85001b23a3dc7f6cd0434b3102df6f46cc483fda56d3e219e9a70aa91a"
    end
  end

  def install
    bin.install Dir["agent-incident-*"].first => "agent-incident"
  end

  test do
    assert_match "0.5.0", shell_output("#{bin}/agent-incident --version")
    assert_match "incident", shell_output("#{bin}/agent-incident --help")
  end
end
