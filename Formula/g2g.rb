class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.48.0/g2g-darwin-arm64.tar.gz"
      sha256 "1e6b1925d253cb198a8afba19e32020ad6dba312ec538b9d0875a7fc555928ac"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.48.0/g2g-darwin-amd64.tar.gz"
      sha256 "e2460295854071cb217ce108025a2f17e1a7df63739ef2e4e0d3e07be971a9d8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.48.0/g2g-linux-arm64.tar.gz"
      sha256 "abe177241850fcc01c1d166bb2a1cdd8c90f5baf966fa5e73c2080c470786ece"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.48.0/g2g-linux-amd64.tar.gz"
      sha256 "9b29921e463ca65f37eb8181346cfeb0acd97b27590badd20d9a320a33e0394b"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.48.0", shell_output("#{bin}/g2g --version")
    assert_match "Manage stacked branches", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
