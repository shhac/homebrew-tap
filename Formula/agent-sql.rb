class AgentSql < Formula
  desc "Read-only SQL CLI for AI agents"
  homepage "https://github.com/shhac/agent-sql"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v0.5.0/agent-sql-darwin-arm64.tar.gz"
      sha256 "ac74ea6caf3f526826581d0b660b764f34e1d22b587ef0d41467e3d15a30a625"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v0.5.0/agent-sql-darwin-x64.tar.gz"
      sha256 "2960a1bfeaf54414faf8311422829c392515aff531ef312ad2b5d41b7701e05d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v0.5.0/agent-sql-linux-arm64.tar.gz"
      sha256 "d69203015857d48f1192462d6cd2bf51e677198322dae88fbaebefbf63af1f9f"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v0.5.0/agent-sql-linux-x64.tar.gz"
      sha256 "3a1d01a64998b832565534a1a0fab8109210e18152abf4981a3aa396d874418a"
    end
  end

  def install
    bin.install Dir["agent-sql-*"].first => "agent-sql"
  end

  test do
    assert_match "0.5.0", shell_output("#{bin}/agent-sql --version")
    assert_match "SQL CLI", shell_output("#{bin}/agent-sql --help")
  end
end
