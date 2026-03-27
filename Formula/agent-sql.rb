class AgentSql < Formula
  desc "Read-only SQL CLI for AI agents"
  homepage "https://github.com/shhac/agent-sql"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v0.1.1/agent-sql-darwin-arm64.tar.gz"
      sha256 "34d22ef22baba442c2b7903d5c270e547c16501b7e4e5752a2c3b022bdcd6df4"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v0.1.1/agent-sql-darwin-x64.tar.gz"
      sha256 "9077585b3ccc4bec44d8b80598ae4692f8fbec6f61478621a0077435ba755807"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v0.1.1/agent-sql-linux-arm64.tar.gz"
      sha256 "1cc9bbe6c24f6c09a8b0ac836ee5227b95f3ba478f7babcdb3c9783fc0671949"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v0.1.1/agent-sql-linux-x64.tar.gz"
      sha256 "c701641f7ea8919688a32aea34fca668f6fe84ffa1cb09a66c2ae338db08e33f"
    end
  end

  def install
    bin.install Dir["agent-sql-*"].first => "agent-sql"
  end

  test do
    assert_match "0.1.1", shell_output("#{bin}/agent-sql --version")
    assert_match "SQL CLI", shell_output("#{bin}/agent-sql --help")
  end
end
