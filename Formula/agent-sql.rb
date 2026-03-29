class AgentSql < Formula
  desc "Read-only SQL CLI for AI agents"
  homepage "https://github.com/shhac/agent-sql"
  version "1.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.2.0/agent-sql-darwin-arm64.tar.gz"
      sha256 "357c6b2bb766331bfde2b902651b319010cb32e9b168a0c176581469e27a57f9"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.2.0/agent-sql-darwin-amd64.tar.gz"
      sha256 "d63a92429002b38cd57a70cec95f3324cfdf18e19b6d75b5706222ff41af4f6c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.2.0/agent-sql-linux-arm64.tar.gz"
      sha256 "ca6231115d31603c67619a62032b873453cc432b26db2179137b81c751d90a05"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.2.0/agent-sql-linux-amd64.tar.gz"
      sha256 "1a9340ca2488b44deee60d5a8510f2ddfc34762d1a4c1358615f31be21120043"
    end
  end

  def install
    bin.install Dir["agent-sql-*"].first => "agent-sql"
  end

  test do
    assert_match "1.2.0", shell_output("#{bin}/agent-sql --version")
    assert_match "SQL CLI", shell_output("#{bin}/agent-sql --help")
  end
end
