class AgentSql < Formula
  desc "Read-only SQL CLI for AI agents"
  homepage "https://github.com/shhac/agent-sql"
  version "1.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.11.0/agent-sql-darwin-arm64.tar.gz"
      sha256 "de93c9a4d9e722bf4108917b791865b39acfdafb1f39bad1df6bee10c2e982c1"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.11.0/agent-sql-darwin-amd64.tar.gz"
      sha256 "396cd49911bebc0ba4254ca20531323cd6aab5fb5a7ca4041ee1dec66f86c155"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.11.0/agent-sql-linux-arm64.tar.gz"
      sha256 "5df171c3fc2910d89326f27c8a947d3a0364c90778e543f41b8532fe7eb7c2f9"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.11.0/agent-sql-linux-amd64.tar.gz"
      sha256 "61906ac1cc806ba3fb54bffdd1e3d73a52f9c2c8e416ac00237ca72608754401"
    end
  end

  def install
    bin.install "agent-sql"
    # Installs shell completions via `agent-sql completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-sql", "completion")
  end

  test do
    assert_match "1.11.0", shell_output("#{bin}/agent-sql --version")
    assert_match "Read-only-by-default SQL CLI", shell_output("#{bin}/agent-sql --help")
    assert_match "#compdef agent-sql", shell_output("#{bin}/agent-sql completion zsh")
  end
end
