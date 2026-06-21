class AgentSql < Formula
  desc "Read-only SQL CLI for AI agents"
  homepage "https://github.com/shhac/agent-sql"
  version "1.9.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.9.1/agent-sql-darwin-arm64.tar.gz"
      sha256 "5805908091ccd4364ff9f1a90024b7b8c6c1461fb5d5f235b10c83aa48c1dca6"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.9.1/agent-sql-darwin-amd64.tar.gz"
      sha256 "9b0edb740ce18148c6876f3427f3c3e78c8017770e4e2a2175a7714518b27df9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.9.1/agent-sql-linux-arm64.tar.gz"
      sha256 "4c89ca3293672f3e0a2a20853339437b3fa557a6b136ea5f57a9e8f1586cca32"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.9.1/agent-sql-linux-amd64.tar.gz"
      sha256 "f62ca9f82e4296d6a9fb3b517042a5b286c959f1476bbc3d73c49c113d058c72"
    end
  end

  def install
    bin.install "agent-sql"
    # Installs shell completions via `agent-sql completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-sql", "completion")
  end

  test do
    assert_match "1.9.1", shell_output("#{bin}/agent-sql --version")
    assert_match "Read-only-by-default SQL CLI", shell_output("#{bin}/agent-sql --help")
    assert_match "#compdef agent-sql", shell_output("#{bin}/agent-sql completion zsh")
  end
end
