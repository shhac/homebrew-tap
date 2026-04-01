class AgentDd < Formula
  desc "Datadog triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-datadog"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-datadog/releases/download/v0.1.0/agent-dd-darwin-arm64.tar.gz"
      sha256 "1ad1415a108b8b594eb5567103581ec0e87ca48fcee8fef57475fdc2137002dd"
    end
    on_intel do
      url "https://github.com/shhac/agent-datadog/releases/download/v0.1.0/agent-dd-darwin-amd64.tar.gz"
      sha256 "64e9699e9aaa952356d92b87da0e4e26d4cd292bc3eb8b650cc1dc809c56ffce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-datadog/releases/download/v0.1.0/agent-dd-linux-arm64.tar.gz"
      sha256 "e5437092613f81e4242a78dde885c228a0681934a936eb055914e0d78162575a"
    end
    on_intel do
      url "https://github.com/shhac/agent-datadog/releases/download/v0.1.0/agent-dd-linux-amd64.tar.gz"
      sha256 "ebb6406c43f84aa2496efe87b574508b70ebe49b8e79cab1deed00c01f53ca8b"
    end
  end

  def install
    bin.install Dir["agent-dd-*"].first => "agent-dd"
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/agent-dd version")
    assert_match "Datadog", shell_output("#{bin}/agent-dd --help")
  end
end
