class AgentSql < Formula
  desc "Read-only SQL CLI for AI agents"
  homepage "https://github.com/shhac/agent-sql"
  version "1.16.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.16.1/agent-sql-darwin-arm64.tar.gz"
      sha256 "f1c4e42cd1a992c8877f5ea2ebabdcc25b619ace2a30faa1ecb335cdb9557ace"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.16.1/agent-sql-darwin-amd64.tar.gz"
      sha256 "a94399329a58a462e7cc7c1e466263a94c50f8b5b3360bc64607f893c6b4a455"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.16.1/agent-sql-linux-arm64.tar.gz"
      sha256 "073ce45ad5b917f03d2c6224d305cead68c13355b56666ebff11cb12d16686aa"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.16.1/agent-sql-linux-amd64.tar.gz"
      sha256 "24ccba0d8ecb75c54dece99364cb9d83751c997b6915064096f3a0c01c3badf5"
    end
  end

  def install
    bin.install "agent-sql"
    # Installs shell completions via `agent-sql completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-sql", "completion")
  end

  test do
    assert_match "1.16.1", shell_output("#{bin}/agent-sql --version")
    assert_match "Read-only-by-default SQL CLI", shell_output("#{bin}/agent-sql --help")
    assert_match "#compdef agent-sql", shell_output("#{bin}/agent-sql completion zsh")
  end
end
