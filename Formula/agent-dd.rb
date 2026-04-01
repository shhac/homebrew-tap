class AgentDd < Formula
  desc "Datadog triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-dd"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.2.0/agent-dd-darwin-arm64.tar.gz"
      sha256 "75925f1eab3f9d5f40fcf38456d91c06682d699e664691e8b2df921cf9eeb980"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.2.0/agent-dd-darwin-amd64.tar.gz"
      sha256 "4dd5a158ea1c3497ec8217bf9524bdaae8b3f705bcde4a2360fd4ac65858c4c1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.2.0/agent-dd-linux-arm64.tar.gz"
      sha256 "949f3f70eb8db616f384342ed3af25ffdbf61e74b5d6d7efc684fc18e66851a9"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.2.0/agent-dd-linux-amd64.tar.gz"
      sha256 "7be41767672f2cc8a943d9cd04abedbf559ec8f44d5a1912c8f95e45d2f04c5d"
    end
  end

  def install
    bin.install Dir["agent-dd-*"].first => "agent-dd"
  end

  test do
    assert_match "0.2.0", shell_output("#{bin}/agent-dd version")
    assert_match "Datadog", shell_output("#{bin}/agent-dd --help")
  end
end
