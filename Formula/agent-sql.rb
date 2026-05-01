class AgentSql < Formula
  desc "Read-only SQL CLI for AI agents"
  homepage "https://github.com/shhac/agent-sql"
  version "1.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.5.0/agent-sql-darwin-arm64.tar.gz"
      sha256 "bdf0b9bd4e54e80ccb9928feb09dd63a0b9ab0deb4e78c42caf308a4aa6b5b61"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.5.0/agent-sql-darwin-amd64.tar.gz"
      sha256 "60d5f03ab87f76f86f003379e5c69fb9878fdaec0467dba51d2d7c5830989199"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.5.0/agent-sql-linux-arm64.tar.gz"
      sha256 "fd820c312f4629c0d125d3417d2483093caf0010a1e601efde2c071d52485c34"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.5.0/agent-sql-linux-amd64.tar.gz"
      sha256 "447b7d8284333146ee21eb73f6b7c7e76d336242d82b36c9d181ebe24b99d77f"
    end
  end

  def install
    bin.install Dir["agent-sql-*"].first => "agent-sql"
  end

  test do
    assert_match "1.5.0", shell_output("#{bin}/agent-sql --version")
    assert_match "SQL CLI", shell_output("#{bin}/agent-sql --help")
  end
end
