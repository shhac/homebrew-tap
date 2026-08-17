class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  version "0.13.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.13.0/g2g-darwin-arm64.tar.gz"
      sha256 "c0a39820bbbc87a12dd6c3768ba7ee401d807534d46c0d48ea7094945c45cd65"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.13.0/g2g-darwin-amd64.tar.gz"
      sha256 "be8e362924b61117b2ddd73eb13659b5caf121884e481778dd8eb3871d0c8eff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.13.0/g2g-linux-arm64.tar.gz"
      sha256 "eb8ee6d02d0e3297a91dc9bf4a5dfeb730765650b0940b4f651a6f37ebc25f0b"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.13.0/g2g-linux-amd64.tar.gz"
      sha256 "ebc47bf92685a5f125090f5513c042c6067b980dde14ae0f4e7b03018ab90c5a"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.13.0", shell_output("#{bin}/g2g --version")
    assert_match "Link a stack to GitHub", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
