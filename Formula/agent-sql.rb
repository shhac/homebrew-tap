class AgentSql < Formula
  desc "Read-only SQL CLI for AI agents"
  homepage "https://github.com/shhac/agent-sql"
  version "1.17.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.17.1/agent-sql-darwin-arm64.tar.gz"
      sha256 "4d65021760d7619f0f96e8f19ac7b2288f814415fcc6c08378f05175b7947274"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.17.1/agent-sql-darwin-amd64.tar.gz"
      sha256 "099474f43a067538a8577542e4da8bc279cc6dd56431e8704137ef74c66af77b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.17.1/agent-sql-linux-arm64.tar.gz"
      sha256 "3c1c8472f4b1373e34e08a9426bc795943b7ceb928664003a9851d637886af41"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.17.1/agent-sql-linux-amd64.tar.gz"
      sha256 "d57f711aec4c117422cda4c98e5679ec7897013c3ed810b388b4dfa4c70bb455"
    end
  end

  def install
    bin.install "agent-sql"
    # Installs shell completions via `agent-sql completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-sql", "completion")
  end

  test do
    assert_match "1.17.1", shell_output("#{bin}/agent-sql --version")
    assert_match "Read-only-by-default SQL CLI", shell_output("#{bin}/agent-sql --help")
    assert_match "#compdef agent-sql", shell_output("#{bin}/agent-sql completion zsh")
  end
end
