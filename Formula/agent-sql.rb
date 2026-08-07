class AgentSql < Formula
  desc "Read-only SQL CLI for AI agents"
  homepage "https://github.com/shhac/agent-sql"
  version "1.19.2"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.19.2/agent-sql-darwin-arm64.tar.gz"
      sha256 "d6c5448d06aac94c1f1e1a6663db1faeb89629b457f1d35c8e940c14e05571d8"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.19.2/agent-sql-darwin-amd64.tar.gz"
      sha256 "0b97173ff6e548e6766a7213f69913efa17b7933b703adf856a0f74cdb3c2597"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.19.2/agent-sql-linux-arm64.tar.gz"
      sha256 "5beb4d29fadfcc3959ddaf803b696248aa74be20dcda76b481edb44175ebab62"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.19.2/agent-sql-linux-amd64.tar.gz"
      sha256 "9e90906f3ccddd0c791863ac2b9d1d4d0097d15ae568210ffed742ae63c07cf5"
    end
  end

  def install
    bin.install "agent-sql"
    # Installs shell completions via `agent-sql completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-sql", "completion")
  end

  test do
    assert_match "1.19.2", shell_output("#{bin}/agent-sql --version")
    assert_match "Read-only-by-default SQL CLI", shell_output("#{bin}/agent-sql --help")
    assert_match "#compdef agent-sql", shell_output("#{bin}/agent-sql completion zsh")
  end
end
