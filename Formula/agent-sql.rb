class AgentSql < Formula
  desc "Read-only SQL CLI for AI agents"
  homepage "https://github.com/shhac/agent-sql"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v0.6.0/agent-sql-darwin-arm64.tar.gz"
      sha256 "d7b604c5c9fc62fc36ebe2899c4c9f05a1e6ba022069222184b65eadaf938ddc"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v0.6.0/agent-sql-darwin-x64.tar.gz"
      sha256 "495242ffb63b67a1695e00b89a288b47fc5418f3af1c298ebcc6926e18555399"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v0.6.0/agent-sql-linux-arm64.tar.gz"
      sha256 "5a5e48f2d44b86dccb28950dd3d307fe148660e235f20585a4737cffe2f64857"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v0.6.0/agent-sql-linux-x64.tar.gz"
      sha256 "7b7fb5e4e59169c8c65b2cfe9f73974e44a9416957e13c00d1a33031b43bfbaf"
    end
  end

  def install
    bin.install Dir["agent-sql-*"].first => "agent-sql"
  end

  test do
    assert_match "0.6.0", shell_output("#{bin}/agent-sql --version")
    assert_match "SQL CLI", shell_output("#{bin}/agent-sql --help")
  end
end
