class AgentSql < Formula
  desc "Read-only SQL CLI for AI agents"
  homepage "https://github.com/shhac/agent-sql"
  version "1.15.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.15.0/agent-sql-darwin-arm64.tar.gz"
      sha256 "570410d4cae1d95f97dbc3500faba7c36ab6e8b415f67126d08ec7706d8ae709"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.15.0/agent-sql-darwin-amd64.tar.gz"
      sha256 "b35b0ee3f47597036b64542f1cebdcaa9624a68ac4bddf59ac2a9fa89dd04185"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.15.0/agent-sql-linux-arm64.tar.gz"
      sha256 "7da13f6b5b9f2d1903ea5b64d2275a11b5f58b8d47a290d463e0865f6a45fb05"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.15.0/agent-sql-linux-amd64.tar.gz"
      sha256 "dcb38afcd40c955dcfedaa622b19cd2b0da3364209da9e42af3f68b0a5e6d67d"
    end
  end

  def install
    bin.install "agent-sql"
    # Installs shell completions via `agent-sql completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-sql", "completion")
  end

  test do
    assert_match "1.15.0", shell_output("#{bin}/agent-sql --version")
    assert_match "Read-only-by-default SQL CLI", shell_output("#{bin}/agent-sql --help")
    assert_match "#compdef agent-sql", shell_output("#{bin}/agent-sql completion zsh")
  end
end
