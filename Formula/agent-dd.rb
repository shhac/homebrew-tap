class AgentDd < Formula
  desc "Datadog triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-dd"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.3.1/agent-dd-darwin-arm64.tar.gz"
      sha256 "379d00a40f26b076f3a073e526e07cccf66a3a996b60c560f3b70325a0f97fb9"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.3.1/agent-dd-darwin-amd64.tar.gz"
      sha256 "20800298225e89e06077e64c7d775f95d7689fb17f2ad310a5941dfa4918fcd8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.3.1/agent-dd-linux-arm64.tar.gz"
      sha256 "409f5d4344e932833674ff72e558d7618ac640499442ea1250e02b406022020c"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.3.1/agent-dd-linux-amd64.tar.gz"
      sha256 "50e3409eb10fa674b2c462a07eee3b40bbbc09ba773e4a494da2ecd3d8789d2d"
    end
  end

  def install
    bin.install Dir["agent-dd-*"].first => "agent-dd"
  end

  test do
    assert_match "0.3.1", shell_output("#{bin}/agent-dd version")
    assert_match "Datadog", shell_output("#{bin}/agent-dd --help")
  end
end
