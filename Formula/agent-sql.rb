class AgentSql < Formula
  desc "Read-only SQL CLI for AI agents"
  homepage "https://github.com/shhac/agent-sql"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v0.4.0/agent-sql-darwin-arm64.tar.gz"
      sha256 "9ec824a9fafbed9b5fc3511d983f21a539917bcca66a9ccd1b52918d898e6fc9"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v0.4.0/agent-sql-darwin-x64.tar.gz"
      sha256 "7620f0a7e5c11a7c030ab1fb828bc9919d20bcad4f0498fde2bf796773e0d920"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v0.4.0/agent-sql-linux-arm64.tar.gz"
      sha256 "90b9a3aca0a93b3b0c407cbf44efc0dfb7294a018de82494baabc5804a80ac91"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v0.4.0/agent-sql-linux-x64.tar.gz"
      sha256 "ba6e13468a158c691ac2e2829465dc2e90119d54a8b18865e5196c6d6243ba5a"
    end
  end

  def install
    bin.install Dir["agent-sql-*"].first => "agent-sql"
  end

  test do
    assert_match "0.4.0", shell_output("#{bin}/agent-sql --version")
    assert_match "SQL CLI", shell_output("#{bin}/agent-sql --help")
  end
end
