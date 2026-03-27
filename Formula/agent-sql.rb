class AgentSql < Formula
  desc "Read-only SQL CLI for AI agents"
  homepage "https://github.com/shhac/agent-sql"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v0.1.2/agent-sql-darwin-arm64.tar.gz"
      sha256 "d4d5fe79fd7040e00629f59b8004130b84a939468a7eeb5753f7a78641ee3497"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v0.1.2/agent-sql-darwin-x64.tar.gz"
      sha256 "aa86dc6ec9449a9887555a08136198f8a0a907dd09eb04f1a2463be1e906e581"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v0.1.2/agent-sql-linux-arm64.tar.gz"
      sha256 "5421e1a86d121ee26d88973626876ed81c62c6a1a2bd938e97db0ec010eb92ab"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v0.1.2/agent-sql-linux-x64.tar.gz"
      sha256 "ebe36f09cf967331286aa900921c258cc319ac9b2e9c868c5152bd012c051769"
    end
  end

  def install
    bin.install Dir["agent-sql-*"].first => "agent-sql"
  end

  test do
    assert_match "0.1.2", shell_output("#{bin}/agent-sql --version")
    assert_match "SQL CLI", shell_output("#{bin}/agent-sql --help")
  end
end
