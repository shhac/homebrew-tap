class AgentSql < Formula
  desc "Read-only SQL CLI for AI agents"
  homepage "https://github.com/shhac/agent-sql"
  version "1.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.3.0/agent-sql-darwin-arm64.tar.gz"
      sha256 "d85691916486c9a95b84e80fbe58061616bdb33bea510b7492955a94d13d6d54"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.3.0/agent-sql-darwin-amd64.tar.gz"
      sha256 "848d65fa99e286408cd06de8a21819c2a393c29b4e9557451112cbcb3e6416d1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.3.0/agent-sql-linux-arm64.tar.gz"
      sha256 "7a7aeb0cd6bb899f625f806c59729ae176b281faf5dc5022b1694093bbcbfa8b"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.3.0/agent-sql-linux-amd64.tar.gz"
      sha256 "4211d00cdc76b26b092fea3626b108d9196cfb57318035e2dc88a1690f967d1b"
    end
  end

  def install
    bin.install Dir["agent-sql-*"].first => "agent-sql"
  end

  test do
    assert_match "1.3.0", shell_output("#{bin}/agent-sql --version")
    assert_match "SQL CLI", shell_output("#{bin}/agent-sql --help")
  end
end
