class AgentSql < Formula
  desc "Read-only SQL CLI for AI agents"
  homepage "https://github.com/shhac/agent-sql"
  version "1.16.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.16.0/agent-sql-darwin-arm64.tar.gz"
      sha256 "9d003b264eeabf01f61dff5092f2046254d9927a9d91b4c49bad6718ee5e04ca"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.16.0/agent-sql-darwin-amd64.tar.gz"
      sha256 "32c760548ebe33bc46480efa176a1c4356d5b884c9756cf5b3ae795319d0ae4c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.16.0/agent-sql-linux-arm64.tar.gz"
      sha256 "e3ebfadb08a9d4dc67d7425862f3ce48c662db83aa654c3725fc272d3a8416ea"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.16.0/agent-sql-linux-amd64.tar.gz"
      sha256 "7c2c853daae3aaf41c9eaca8e7ff6a37b5f2f58c0a2d7cf86d89776c2173c66a"
    end
  end

  def install
    bin.install "agent-sql"
    # Installs shell completions via `agent-sql completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-sql", "completion")
  end

  test do
    assert_match "1.16.0", shell_output("#{bin}/agent-sql --version")
    assert_match "Read-only-by-default SQL CLI", shell_output("#{bin}/agent-sql --help")
    assert_match "#compdef agent-sql", shell_output("#{bin}/agent-sql completion zsh")
  end
end
