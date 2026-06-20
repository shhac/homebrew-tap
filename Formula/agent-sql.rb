class AgentSql < Formula
  desc "Read-only SQL CLI for AI agents"
  homepage "https://github.com/shhac/agent-sql"
  version "1.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.8.0/agent-sql-darwin-arm64.tar.gz"
      sha256 "07386ddd57a4453b6508d9db6dfd1a3004970779e3a89fc08f361f6fb3a522e3"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.8.0/agent-sql-darwin-amd64.tar.gz"
      sha256 "4f5eb6cec98e683780ebf2aac45b1bebfb712ccaa3794b9a1e1eafb95e1ebb09"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-sql/releases/download/v1.8.0/agent-sql-linux-arm64.tar.gz"
      sha256 "ec6767b0739842d96815d52e42e3b263be2808bbbcc90013a99f84ef65b61308"
    end
    on_intel do
      url "https://github.com/shhac/agent-sql/releases/download/v1.8.0/agent-sql-linux-amd64.tar.gz"
      sha256 "c6e927add32b8d950034c478624308cf5dca728a00305d51bc06581e18af76d1"
    end
  end

  def install
    bin.install Dir["agent-sql-*"].first => "agent-sql"
  end

  test do
    assert_match "1.8.0", shell_output("#{bin}/agent-sql --version")
    assert_match "SQL CLI", shell_output("#{bin}/agent-sql --help")
  end
end
