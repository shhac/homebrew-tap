class AgentSql < Formula
  desc "Read-only SQL CLI for AI agents"
  homepage "https://github.com/shhac/agent-sql"
  version "1.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.1.0/agent-sql-darwin-arm64.tar.gz"
      sha256 "d5d237c1d8d249f71513a15dfa8c3fbbc91fa8dadcf6e718619bc392480b0ad5"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.1.0/agent-sql-darwin-amd64.tar.gz"
      sha256 "4da0fdacfac1a5ff0d533e3fe0b6daa3302b2151aa66671c801597b23e87dded"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.1.0/agent-sql-linux-arm64.tar.gz"
      sha256 "b5b85d8c1da0f4c572f45bed59cb0bc5ab59e1bf56bcb2837d990fc0167e290a"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.1.0/agent-sql-linux-amd64.tar.gz"
      sha256 "b2efa211e55224f435ad3abbed5700a1de1511ce76464dacbe6c6fe5b4313a88"
    end
  end

  def install
    bin.install Dir["agent-sql-*"].first => "agent-sql"
  end

  test do
    assert_match "1.1.0", shell_output("#{bin}/agent-sql --version")
    assert_match "SQL CLI", shell_output("#{bin}/agent-sql --help")
  end
end
