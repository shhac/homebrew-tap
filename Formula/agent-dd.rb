class AgentDd < Formula
  desc "Datadog triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-dd"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.3.0/agent-dd-darwin-arm64.tar.gz"
      sha256 "47cff56943cd413d41ab245d9cffa9027a8f223f276ab305985aa7b03b4eac8b"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.3.0/agent-dd-darwin-amd64.tar.gz"
      sha256 "fb470716340003cf00ce9d3883ceef335d638ea74827602b90b73c8fb1d1805a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.3.0/agent-dd-linux-arm64.tar.gz"
      sha256 "09d846188326f91a808aaa1803c67d0fe0716ba085551a27f2876e890e259407"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.3.0/agent-dd-linux-amd64.tar.gz"
      sha256 "a1d5ea43a8fafa4ac0d35675379b0f8c9b32bc490f48c894d39f904ca4a6a897"
    end
  end

  def install
    bin.install Dir["agent-dd-*"].first => "agent-dd"
  end

  test do
    assert_match "0.3.0", shell_output("#{bin}/agent-dd version")
    assert_match "Datadog", shell_output("#{bin}/agent-dd --help")
  end
end
