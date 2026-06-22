class AgentSql < Formula
  desc "Read-only SQL CLI for AI agents"
  homepage "https://github.com/shhac/agent-sql"
  version "1.14.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.14.0/agent-sql-darwin-arm64.tar.gz"
      sha256 "f9a7adb3cebfe62f069ef684dd99f06607ecd300178c6c3cb7d2ecf974e32303"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.14.0/agent-sql-darwin-amd64.tar.gz"
      sha256 "37eb97727db8ce64f65b97c49f1d7f7a44d181951deedb0b95aaba16cbeb9ad6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.14.0/agent-sql-linux-arm64.tar.gz"
      sha256 "1b1e06a4ffe1ce3c1bc59fa460967752b70b9526969c9d98fa8d70b2bb32fb5a"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.14.0/agent-sql-linux-amd64.tar.gz"
      sha256 "e30382c65a600d74decf58d33a1ae6a54fdd409e723b5b6fa2c5058af7a6c1ed"
    end
  end

  def install
    bin.install "agent-sql"
    # Installs shell completions via `agent-sql completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-sql", "completion")
  end

  test do
    assert_match "1.14.0", shell_output("#{bin}/agent-sql --version")
    assert_match "Read-only-by-default SQL CLI", shell_output("#{bin}/agent-sql --help")
    assert_match "#compdef agent-sql", shell_output("#{bin}/agent-sql completion zsh")
  end
end
