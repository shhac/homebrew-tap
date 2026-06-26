class AgentSql < Formula
  desc "Read-only SQL CLI for AI agents"
  homepage "https://github.com/shhac/agent-sql"
  version "1.17.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.17.0/agent-sql-darwin-arm64.tar.gz"
      sha256 "3e1996eb5c50a4e70a7d636118f3b243c31d4bfc2b68b6397d2abbff86ee3dc4"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.17.0/agent-sql-darwin-amd64.tar.gz"
      sha256 "959063ad83d26dc3263451c1d34578cebfcfd8b94f1b112e0fc73d9b56eac232"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.17.0/agent-sql-linux-arm64.tar.gz"
      sha256 "32f309c5c2fbf57370c17a5f29f8529ca76fd5360e3056656151f7d5e998cbde"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.17.0/agent-sql-linux-amd64.tar.gz"
      sha256 "8aa7e3aafeace0740c18de8d0e586033586fe0882a74c1b2b540aab4b27a1461"
    end
  end

  def install
    bin.install "agent-sql"
    # Installs shell completions via `agent-sql completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-sql", "completion")
  end

  test do
    assert_match "1.17.0", shell_output("#{bin}/agent-sql --version")
    assert_match "Read-only-by-default SQL CLI", shell_output("#{bin}/agent-sql --help")
    assert_match "#compdef agent-sql", shell_output("#{bin}/agent-sql completion zsh")
  end
end
