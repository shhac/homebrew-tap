class AgentSql < Formula
  desc "Read-only SQL CLI for AI agents"
  homepage "https://github.com/shhac/agent-sql"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v0.3.0/agent-sql-darwin-arm64.tar.gz"
      sha256 "7fb7852a2ebcb97380078c214c83a9b89a366e8384b3c621863d03a456f8353a"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v0.3.0/agent-sql-darwin-x64.tar.gz"
      sha256 "4335df75b7061ed30ec6abf08ed090bb438384dc1fbe00031a7284d88db23174"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v0.3.0/agent-sql-linux-arm64.tar.gz"
      sha256 "b0dc18ff6db8f5c4b662090335483ead98edf1864ad284b26277c956d8206afe"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v0.3.0/agent-sql-linux-x64.tar.gz"
      sha256 "a5548037052dbd49ecbccf6ad84beacda46fa6a8a517f9d5b90056b94604bd51"
    end
  end

  def install
    bin.install Dir["agent-sql-*"].first => "agent-sql"
  end

  test do
    assert_match "0.3.0", shell_output("#{bin}/agent-sql --version")
    assert_match "SQL CLI", shell_output("#{bin}/agent-sql --help")
  end
end
