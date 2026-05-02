class AgentSql < Formula
  desc "Read-only SQL CLI for AI agents"
  homepage "https://github.com/shhac/agent-sql"
  version "1.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.6.0/agent-sql-darwin-arm64.tar.gz"
      sha256 "88c2d1ee27532063cd71cfbdb3324140706fba7ac3176a080f40fb0f04d27165"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.6.0/agent-sql-darwin-amd64.tar.gz"
      sha256 "da7fd1db874bf2e29fd26b0f4654f771de01407464ca6108c06857dfac5bb38e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.6.0/agent-sql-linux-arm64.tar.gz"
      sha256 "5280d4dbb17cdb2d53384bc615247171d3d4ec05c99f8a2f78f6494c49ed9acf"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.6.0/agent-sql-linux-amd64.tar.gz"
      sha256 "df13dc22fa4a1f98b5e2ba60876a1580e044ae60eb508004d08de59010bc77f9"
    end
  end

  def install
    bin.install Dir["agent-sql-*"].first => "agent-sql"
  end

  test do
    assert_match "1.6.0", shell_output("#{bin}/agent-sql --version")
    assert_match "SQL CLI", shell_output("#{bin}/agent-sql --help")
  end
end
