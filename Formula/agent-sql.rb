class AgentSql < Formula
  desc "Read-only SQL CLI for AI agents"
  homepage "https://github.com/shhac/agent-sql"
  version "1.14.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.14.1/agent-sql-darwin-arm64.tar.gz"
      sha256 "19112ea5265b44a6d41f32c4bec8ae5adaff96b5a7bbcf628084f62ffafab972"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.14.1/agent-sql-darwin-amd64.tar.gz"
      sha256 "ccb371748cf307474f3456b7463f09eb22a928e1f47aac4447110cbc9f31f265"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.14.1/agent-sql-linux-arm64.tar.gz"
      sha256 "30a405807d69d40a0106ee7efeb236c1b11ae8f9e77838e49a03758f3f8a6756"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.14.1/agent-sql-linux-amd64.tar.gz"
      sha256 "6bd1583c555baa8811145f2c766662643f2464c076eca44019f7fa4cd5dd19f9"
    end
  end

  def install
    bin.install "agent-sql"
    # Installs shell completions via `agent-sql completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-sql", "completion")
  end

  test do
    assert_match "1.14.1", shell_output("#{bin}/agent-sql --version")
    assert_match "Read-only-by-default SQL CLI", shell_output("#{bin}/agent-sql --help")
    assert_match "#compdef agent-sql", shell_output("#{bin}/agent-sql completion zsh")
  end
end
