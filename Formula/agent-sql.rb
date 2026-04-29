class AgentSql < Formula
  desc "Read-only SQL CLI for AI agents"
  homepage "https://github.com/shhac/agent-sql"
  version "1.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.4.0/agent-sql-darwin-arm64.tar.gz"
      sha256 "222dc90509fbfe0830f4be8c86d61d290d937731e4be2dd5fa29c8662da9ff63"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.4.0/agent-sql-darwin-amd64.tar.gz"
      sha256 "335861ff45be3dbc5f6ec4c0ddb3941364e3d53ec04a46185ba6782045fb7fee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.4.0/agent-sql-linux-arm64.tar.gz"
      sha256 "33fdebd886d0bd0e05c75bebcbc4889545bbb52675ea085f670d8e2aa894b8f2"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.4.0/agent-sql-linux-amd64.tar.gz"
      sha256 "131c5b4e728a471d2dbd5d00cf7b43b8d96990a4725e780f4ed383417331363d"
    end
  end

  def install
    bin.install Dir["agent-sql-*"].first => "agent-sql"
  end

  test do
    assert_match "1.4.0", shell_output("#{bin}/agent-sql --version")
    assert_match "SQL CLI", shell_output("#{bin}/agent-sql --help")
  end
end
