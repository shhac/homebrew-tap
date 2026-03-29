class AgentSql < Formula
  desc "Read-only SQL CLI for AI agents"
  homepage "https://github.com/shhac/agent-sql"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.0.0/agent-sql-darwin-arm64.tar.gz"
      sha256 "68f91ca9fdb340358d82dd901276c567919fd9be8a064d86d9cdd3cb2c2f508f"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.0.0/agent-sql-darwin-amd64.tar.gz"
      sha256 "7a2127656e6d71c9796fad36b9e3b26de3484f5b33a19555e19f8007b9b9ce86"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.0.0/agent-sql-linux-arm64.tar.gz"
      sha256 "255d78c1d3b5871c4f08e358c2696811be55b3ed701200179ab95c3d05de6f6c"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.0.0/agent-sql-linux-amd64.tar.gz"
      sha256 "87fba2b9d5510730a367d8e7dc96c66d7962b29942c10b337b6285e455ef2dd7"
    end
  end

  def install
    bin.install Dir["agent-sql-*"].first => "agent-sql"
  end

  test do
    assert_match "1.0.0", shell_output("#{bin}/agent-sql --version")
    assert_match "SQL CLI", shell_output("#{bin}/agent-sql --help")
  end
end
