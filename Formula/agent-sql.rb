class AgentSql < Formula
  desc "Read-only SQL CLI for AI agents"
  homepage "https://github.com/shhac/agent-sql"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v0.2.0/agent-sql-darwin-arm64.tar.gz"
      sha256 "97c728bce8f2d95e9c001d89ddc8cfcf3e609d9ea966fc924464a6a10b309b3b"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v0.2.0/agent-sql-darwin-x64.tar.gz"
      sha256 "b24eb0fe92ede180989c0fa428aeee187da0d9a33738d7bbb7928afdeee824c5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v0.2.0/agent-sql-linux-arm64.tar.gz"
      sha256 "3917b7a095f3f7e8ec5910d8e7dd84f52c5ce4271ac0ccfc444bb9cb21fe19ba"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v0.2.0/agent-sql-linux-x64.tar.gz"
      sha256 "fe352fee874c3fe56bd89c9ede34c5f9a06dc6f735050a452efe99501bcb9fb7"
    end
  end

  def install
    bin.install Dir["agent-sql-*"].first => "agent-sql"
  end

  test do
    assert_match "0.2.0", shell_output("#{bin}/agent-sql --version")
    assert_match "SQL CLI", shell_output("#{bin}/agent-sql --help")
  end
end
