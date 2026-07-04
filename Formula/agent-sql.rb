class AgentSql < Formula
  desc "Read-only SQL CLI for AI agents"
  homepage "https://github.com/shhac/agent-sql"
  version "1.18.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.18.0/agent-sql-darwin-arm64.tar.gz"
      sha256 "ac896412ea81404a84a5c141bcb5fde0ebc237e53853f0752709deefc0283fbf"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.18.0/agent-sql-darwin-amd64.tar.gz"
      sha256 "227a4c872c6d607436216540b94e04136125a1de5e6d9ba140a5223a36026cfe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.18.0/agent-sql-linux-arm64.tar.gz"
      sha256 "c4fe0e8617f9cada012073ef8607be0ef2a89ded3bc44e66edb0ffa6b5e41169"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.18.0/agent-sql-linux-amd64.tar.gz"
      sha256 "4fe283b341d9a3867149796da688ef42cffb5200409d211033da7874a2228dd1"
    end
  end

  def install
    bin.install "agent-sql"
    # Installs shell completions via `agent-sql completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-sql", "completion")
  end

  test do
    assert_match "1.18.0", shell_output("#{bin}/agent-sql --version")
    assert_match "Read-only-by-default SQL CLI", shell_output("#{bin}/agent-sql --help")
    assert_match "#compdef agent-sql", shell_output("#{bin}/agent-sql completion zsh")
  end
end
