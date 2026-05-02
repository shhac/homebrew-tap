class AgentSql < Formula
  desc "Read-only SQL CLI for AI agents"
  homepage "https://github.com/shhac/agent-sql"
  version "1.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.6.1/agent-sql-darwin-arm64.tar.gz"
      sha256 "11162b4c93ab148f5463959448d1d1c581e016d435e747ea957a7ef954212cf1"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.6.1/agent-sql-darwin-amd64.tar.gz"
      sha256 "182ae1c50f0b79464fc77e643c61fe225111bab237fa3a725058f8931cea0a7f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.6.1/agent-sql-linux-arm64.tar.gz"
      sha256 "3ff7ce945cfff79a99ae9a8ccea4d5faef22d0dc805d29863bc07d43c865ca56"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.6.1/agent-sql-linux-amd64.tar.gz"
      sha256 "0acd21c39a459165cd20d62b204d77cf59de8fe02d8a53e0d82fd61a09e11a00"
    end
  end

  def install
    bin.install Dir["agent-sql-*"].first => "agent-sql"
  end

  test do
    assert_match "1.6.1", shell_output("#{bin}/agent-sql --version")
    assert_match "SQL CLI", shell_output("#{bin}/agent-sql --help")
  end
end
