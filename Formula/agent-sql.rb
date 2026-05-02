class AgentSql < Formula
  desc "Read-only SQL CLI for AI agents"
  homepage "https://github.com/shhac/agent-sql"
  version "1.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.7.0/agent-sql-darwin-arm64.tar.gz"
      sha256 "01c193232d0c9f230005f16bb967c71ff7c65c463c260fb32bb3497ff20bdc8d"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.7.0/agent-sql-darwin-amd64.tar.gz"
      sha256 "8f8d0ff2037c5b1ecf1f118b354c82a378bf3ad3f888c5069f87b4668175a0e4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.7.0/agent-sql-linux-arm64.tar.gz"
      sha256 "93a32bf4d22307aa5ff4550bc494e41344d5d8455175819d187d5e9155dd2727"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.7.0/agent-sql-linux-amd64.tar.gz"
      sha256 "1a638138b0d4672bec28b8131f5650e0dd17ffca197e116a25b5c2e72e789b37"
    end
  end

  def install
    bin.install Dir["agent-sql-*"].first => "agent-sql"
  end

  test do
    assert_match "1.7.0", shell_output("#{bin}/agent-sql --version")
    assert_match "SQL CLI", shell_output("#{bin}/agent-sql --help")
  end
end
