class AgentSql < Formula
  desc "Read-only SQL CLI for AI agents"
  homepage "https://github.com/shhac/agent-sql"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v0.1.3/agent-sql-darwin-arm64.tar.gz"
      sha256 "5422a9295f2aef464790916e79da880ae74d495a4f4edeeeb40e3e78cbb40c2a"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v0.1.3/agent-sql-darwin-x64.tar.gz"
      sha256 "55706ad52e923ab31af205b3a851c220625651b3a87e75040c13d7a94ba63a8b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v0.1.3/agent-sql-linux-arm64.tar.gz"
      sha256 "26b1ddcc9a4d2978e3d2ee718ac8dbd1c0e704a1a5f2b4fb3e665fd6871d81d7"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v0.1.3/agent-sql-linux-x64.tar.gz"
      sha256 "81b53933bd92bdc0ac9eac3ddbca190e1b8bba39fe02bc70853688b2ea2e5c56"
    end
  end

  def install
    bin.install Dir["agent-sql-*"].first => "agent-sql"
  end

  test do
    assert_match "0.1.3", shell_output("#{bin}/agent-sql --version")
    assert_match "SQL CLI", shell_output("#{bin}/agent-sql --help")
  end
end
