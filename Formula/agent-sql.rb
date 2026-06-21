class AgentSql < Formula
  desc "Read-only SQL CLI for AI agents"
  homepage "https://github.com/shhac/agent-sql"
  version "1.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.10.0/agent-sql-darwin-arm64.tar.gz"
      sha256 "885d6c13c988b7d00e3dc4dfdc0ebd4be5534f4c1d1c4079f1cc1df8792eb38c"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.10.0/agent-sql-darwin-amd64.tar.gz"
      sha256 "e7d6491cf2825f1bd6ff938531d379da827c5ce4a16577c48ce4c5af73fc1075"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.10.0/agent-sql-linux-arm64.tar.gz"
      sha256 "b0ae08fd2369d8886ec4cfab96111c305b8668351b0ee38eb7a4e4917801ae6d"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.10.0/agent-sql-linux-amd64.tar.gz"
      sha256 "815f47c6570efebc98a23eca028e4264c77da9573222e0a7f5e6a6d8b06de738"
    end
  end

  def install
    bin.install "agent-sql"
    # Installs shell completions via `agent-sql completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-sql", "completion")
  end

  test do
    assert_match "1.10.0", shell_output("#{bin}/agent-sql --version")
    assert_match "Read-only-by-default SQL CLI", shell_output("#{bin}/agent-sql --help")
    assert_match "#compdef agent-sql", shell_output("#{bin}/agent-sql completion zsh")
  end
end
