class AgentSql < Formula
  desc "Read-only SQL CLI for AI agents"
  homepage "https://github.com/shhac/agent-sql"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v0.2.1/agent-sql-darwin-arm64.tar.gz"
      sha256 "b7114d4e98d14aa37066030c68bd9a4196d5f8f6c0267dab249c4d9089e6a5aa"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v0.2.1/agent-sql-darwin-x64.tar.gz"
      sha256 "6b44366b03c887aee113927148e69fb9eee3811e7c2592cfb1788188e44ece22"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v0.2.1/agent-sql-linux-arm64.tar.gz"
      sha256 "bfcd0948f673cdbfe1abbb21ef7dce388037dcc0292202a46d3c5c9534d910a6"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v0.2.1/agent-sql-linux-x64.tar.gz"
      sha256 "64489f071a829886ab9d145e2145ad7191269beaad932340fbdbd296d11c7225"
    end
  end

  def install
    bin.install Dir["agent-sql-*"].first => "agent-sql"
  end

  test do
    assert_match "0.2.1", shell_output("#{bin}/agent-sql --version")
    assert_match "SQL CLI", shell_output("#{bin}/agent-sql --help")
  end
end
