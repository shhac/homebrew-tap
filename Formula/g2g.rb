class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.33.0/g2g-darwin-arm64.tar.gz"
      sha256 "6e6ddd91c296aa93f0b106d0c540398a8bc98d9d60a5709e57a8c02f0997f39d"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.33.0/g2g-darwin-amd64.tar.gz"
      sha256 "5b24662a827c4fba22de323913806b65e0a193f7863d3b05dd5da593d22aadba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.33.0/g2g-linux-arm64.tar.gz"
      sha256 "7e1a996ecd169e7d3607bd3fa2059c88329237b71bae26c20a420f06cef44a0d"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.33.0/g2g-linux-amd64.tar.gz"
      sha256 "1f2d990b8b8ff5443ececffddac5d161c15a87c8886e7e2375f7d72d03632e37"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.33.0", shell_output("#{bin}/g2g --version")
    assert_match "Link a stack to GitHub", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
