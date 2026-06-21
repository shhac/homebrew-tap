class AgentSql < Formula
  desc "Read-only SQL CLI for AI agents"
  homepage "https://github.com/shhac/agent-sql"
  version "1.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.9.0/agent-sql-darwin-arm64.tar.gz"
      sha256 "e02f8e25cf590da2db046e7f174a290d319e20440679d81b1268865f0573161e"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.9.0/agent-sql-darwin-amd64.tar.gz"
      sha256 "3a3049cd7fbd9d21fd5cddbf9e4d5048e6ba852483ab006c3867859e2b1830e0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.9.0/agent-sql-linux-arm64.tar.gz"
      sha256 "f43cab886425fea1e85a3397341af360da89df8c99c55a3ba1694952ec183152"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.9.0/agent-sql-linux-amd64.tar.gz"
      sha256 "089afd2eb205607641ef0468cd73865711dbda46c35ad329f6e41e00aca6bad3"
    end
  end

  def install
    bin.install Dir["agent-sql-*"].first => "agent-sql"
  end

  test do
    assert_match "1.9.0", shell_output("#{bin}/agent-sql --version")
    assert_match "SQL CLI", shell_output("#{bin}/agent-sql --help")
  end
end
