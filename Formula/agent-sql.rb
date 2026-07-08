class AgentSql < Formula
  desc "Read-only SQL CLI for AI agents"
  homepage "https://github.com/shhac/agent-sql"
  version "1.19.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.19.0/agent-sql-darwin-arm64.tar.gz"
      sha256 "775d61a20d870855813e13247f949c994b928fcfc50503c3c3ae4dd29eccdd1c"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.19.0/agent-sql-darwin-amd64.tar.gz"
      sha256 "e279abc59c6979400c716914c8adfa3ed06ba41348018b6a8edce9e8c9100199"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.19.0/agent-sql-linux-arm64.tar.gz"
      sha256 "68691f50856ae98fe8225a3adec8cd4ecc71d1f719ec88da3b97c31f320e8bed"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.19.0/agent-sql-linux-amd64.tar.gz"
      sha256 "93c9f26a83af9bdcfc58d52f3e1f1e13f132fd9bcc63342e19cfc3413c276bb8"
    end
  end

  def install
    bin.install "agent-sql"
    # Installs shell completions via `agent-sql completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-sql", "completion")
  end

  test do
    assert_match "1.19.0", shell_output("#{bin}/agent-sql --version")
    assert_match "Read-only-by-default SQL CLI", shell_output("#{bin}/agent-sql --help")
    assert_match "#compdef agent-sql", shell_output("#{bin}/agent-sql completion zsh")
  end
end
