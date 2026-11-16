class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.59.0/g2g-darwin-arm64.tar.gz"
      sha256 "310315300ae109900b43bfbae80743e7ff26dd7d44ae43962d29bd8643f333c1"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.59.0/g2g-darwin-amd64.tar.gz"
      sha256 "5197997c21dd69404ce0468395b19da9569022636d5591e5b039261e6ba452b4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.59.0/g2g-linux-arm64.tar.gz"
      sha256 "c554d685e9189a3de9c59bd97fb253957feb37529b61950a5a21597fac8c72fa"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.59.0/g2g-linux-amd64.tar.gz"
      sha256 "bae6d939da6b1dc09ed39bd86b2efffb1d4e6b6c5c8d5bf76a1338ef8c7209d2"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.59.0", shell_output("#{bin}/g2g --version")
    assert_match "Manage stacked branches", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
