class AgentSql < Formula
  desc "Read-only SQL CLI for AI agents"
  homepage "https://github.com/shhac/agent-sql"
  version "1.18.1"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.18.1/agent-sql-darwin-arm64.tar.gz"
      sha256 "f78715fd2447b1cdb5c4d619785ffaecebf9a865de96777b4e18124f47f00b99"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.18.1/agent-sql-darwin-amd64.tar.gz"
      sha256 "11b1ef19b46087197683e5b67daa5dd9bf212c261ed5844364b980bca8e629f8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.18.1/agent-sql-linux-arm64.tar.gz"
      sha256 "894b337a46097cb9eed6517c04f4f2e63e71bf4374dd0d712da39adc619b306b"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.18.1/agent-sql-linux-amd64.tar.gz"
      sha256 "06e200e12c0be69ed363887b3b41e9d4ae49c2379801d91cbdcbef0aeb66d984"
    end
  end

  def install
    bin.install "agent-sql"
    # Installs shell completions via `agent-sql completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-sql", "completion")
  end

  test do
    assert_match "1.18.1", shell_output("#{bin}/agent-sql --version")
    assert_match "Read-only-by-default SQL CLI", shell_output("#{bin}/agent-sql --help")
    assert_match "#compdef agent-sql", shell_output("#{bin}/agent-sql completion zsh")
  end
end
