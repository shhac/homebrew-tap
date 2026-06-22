class AgentSql < Formula
  desc "Read-only SQL CLI for AI agents"
  homepage "https://github.com/shhac/agent-sql"
  version "1.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.12.0/agent-sql-darwin-arm64.tar.gz"
      sha256 "f60451fe48c5304b3b19f59a1266622bae9dcb21075c34dc8ce08e8adcb115ab"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.12.0/agent-sql-darwin-amd64.tar.gz"
      sha256 "4d7f357ff280d6cdc6bd4317a31ef05093b6aecb2d7df05a9601cf7838014f7e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.12.0/agent-sql-linux-arm64.tar.gz"
      sha256 "f58213d3e3cce68f6b91aa512ac64c3baaf921ea909a0d073ae1256c4d4c09a2"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.12.0/agent-sql-linux-amd64.tar.gz"
      sha256 "a27ae9e656bfed2f823f01b4b4148353dce43ccd97a97c5fa40461ce211b53d1"
    end
  end

  def install
    bin.install "agent-sql"
    # Installs shell completions via `agent-sql completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-sql", "completion")
  end

  test do
    assert_match "1.12.0", shell_output("#{bin}/agent-sql --version")
    assert_match "Read-only-by-default SQL CLI", shell_output("#{bin}/agent-sql --help")
    assert_match "#compdef agent-sql", shell_output("#{bin}/agent-sql completion zsh")
  end
end
