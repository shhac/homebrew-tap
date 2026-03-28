class AgentSql < Formula
  desc "Read-only SQL CLI for AI agents"
  homepage "https://github.com/shhac/agent-sql"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v0.3.1/agent-sql-darwin-arm64.tar.gz"
      sha256 "5db1a3da9e66b5ee73386a06c74275e83937b97379b12e3ad3808712f3b4d575"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v0.3.1/agent-sql-darwin-x64.tar.gz"
      sha256 "5016c214cd799e39e76ecb1623d005f6837977646e6353dee0a13d7d107e9aba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v0.3.1/agent-sql-linux-arm64.tar.gz"
      sha256 "e739ebcc1e3c0821f157349b0068e6081eb26194ed5ec406952907656617c065"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v0.3.1/agent-sql-linux-x64.tar.gz"
      sha256 "df5180ae147c8a67fefe8dd5f1eac87e4c3c04902b960935deccf6b53b379c79"
    end
  end

  def install
    bin.install Dir["agent-sql-*"].first => "agent-sql"
  end

  test do
    assert_match "0.3.1", shell_output("#{bin}/agent-sql --version")
    assert_match "SQL CLI", shell_output("#{bin}/agent-sql --help")
  end
end
