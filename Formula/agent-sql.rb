class AgentSql < Formula
  desc "Read-only SQL CLI for AI agents"
  homepage "https://github.com/shhac/agent-sql"
  version "1.13.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.13.0/agent-sql-darwin-arm64.tar.gz"
      sha256 "b116ed03473835530d8203f8105610bebdfb343204a4dffb0871ca2f27c532f0"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.13.0/agent-sql-darwin-amd64.tar.gz"
      sha256 "ffdf5c31a3541cfa50b573b93a7e1f225609ff4cef88162552bce778ef2a294b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.13.0/agent-sql-linux-arm64.tar.gz"
      sha256 "94454acca4ac4f373bffeb7fe4c6b5fff045d97991f703f7d801aeb85549beb3"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.13.0/agent-sql-linux-amd64.tar.gz"
      sha256 "da9a78097765e0ca69a63498d4ffb0ca8fbb4fa56a6ce313a1398f670086eb7f"
    end
  end

  def install
    bin.install "agent-sql"
    # Installs shell completions via `agent-sql completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-sql", "completion")
  end

  test do
    assert_match "1.13.0", shell_output("#{bin}/agent-sql --version")
    assert_match "Read-only-by-default SQL CLI", shell_output("#{bin}/agent-sql --help")
    assert_match "#compdef agent-sql", shell_output("#{bin}/agent-sql completion zsh")
  end
end
