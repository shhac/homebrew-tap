class AgentDd < Formula
  desc "Datadog triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-dd"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.6.0/agent-dd-darwin-arm64.tar.gz"
      sha256 "b652500e8f0b24338c9860ffb6eda6f277941f371aa2f914dcb88efb80788164"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.6.0/agent-dd-darwin-amd64.tar.gz"
      sha256 "3596dad21110b7fb6f21968754b179eade5b481141614f528148a1188c5c7b37"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.6.0/agent-dd-linux-arm64.tar.gz"
      sha256 "97f2e93785334648be8c5dd95d0ded548db3df0422135ab6e72a3bb8f23b679c"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.6.0/agent-dd-linux-amd64.tar.gz"
      sha256 "f480a1cd9245b2a8558d0103c5fecfaf23aeec2766ae343d1a36037f953448b3"
    end
  end

  def install
    bin.install Dir["agent-dd-*"].first => "agent-dd"
  end

  test do
    assert_match "0.6.0", shell_output("#{bin}/agent-dd --version")
    assert_match "Datadog", shell_output("#{bin}/agent-dd --help")
  end
end
