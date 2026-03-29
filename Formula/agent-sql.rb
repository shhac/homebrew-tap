class AgentSql < Formula
  desc "Read-only SQL CLI for AI agents"
  homepage "https://github.com/shhac/agent-sql"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v0.7.0/agent-sql-darwin-arm64.tar.gz"
      sha256 "faaf5713fd6ec3ea6b18764c5b9dea5d01f3d7488822a30ceb739fd678b6fb2b"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v0.7.0/agent-sql-darwin-x64.tar.gz"
      sha256 "0d95fc5bb3d338cbfc26aa828ae0acac50ececdd2e9f224454227d2934b1c6ff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v0.7.0/agent-sql-linux-arm64.tar.gz"
      sha256 "7458be1d53c4a975c9f5b84112826c03732a6230ebc3fbe94526c8ec2946b2af"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v0.7.0/agent-sql-linux-x64.tar.gz"
      sha256 "4ea59277ea7d3d5fae9cebd3f9a1308b983fb22584a12c78c143da1b6ebd0178"
    end
  end

  def install
    bin.install Dir["agent-sql-*"].first => "agent-sql"
  end

  test do
    assert_match "0.7.0", shell_output("#{bin}/agent-sql --version")
    assert_match "SQL CLI", shell_output("#{bin}/agent-sql --help")
  end
end
