class AgentSql < Formula
  desc "Read-only SQL CLI for AI agents"
  homepage "https://github.com/shhac/agent-sql"
  version "1.19.1"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.19.1/agent-sql-darwin-arm64.tar.gz"
      sha256 "b22502ee55681e5d2a0d266bfae7aff77e03bdb38cd2f7edae1dff624f3eae34"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.19.1/agent-sql-darwin-amd64.tar.gz"
      sha256 "35d53356aaba4d3ea2701ff8d7a9ebf310302d894007b60415400f840d2676aa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.19.1/agent-sql-linux-arm64.tar.gz"
      sha256 "4389adaa71222192f5adf2d640f8adfeb99dcb34d8b846bdf6ee93e933112b39"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.19.1/agent-sql-linux-amd64.tar.gz"
      sha256 "b1cfe98f9f60dabf2de4f359dbb5768a18a4fc1c629d15fdcd75e05cb59d3de4"
    end
  end

  def install
    bin.install "agent-sql"
    # Installs shell completions via `agent-sql completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-sql", "completion")
  end

  test do
    assert_match "1.19.1", shell_output("#{bin}/agent-sql --version")
    assert_match "Read-only-by-default SQL CLI", shell_output("#{bin}/agent-sql --help")
    assert_match "#compdef agent-sql", shell_output("#{bin}/agent-sql completion zsh")
  end
end
