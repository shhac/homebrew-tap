class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.8.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.8.1/lin-darwin-arm64.tar.gz"
      sha256 "f05049eefb0f74c42fd9e6e19e3d35484823b76708a2640ebc2665d76e3d22a9"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.8.1/lin-darwin-x64.tar.gz"
      sha256 "0fc41a7c75823f5d971296faf7cfcded20e9f4c5299fe28808faa1cf80ffb824"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.8.1/lin-linux-arm64.tar.gz"
      sha256 "171d542e6303860911294bcea7fd479381d31ddf733404d7e1afdc58a1ba3f3c"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.8.1/lin-linux-x64.tar.gz"
      sha256 "e02e555532a182a507cbb93e74d3e10cbb547137bcf45f74b6157fc0f579940e"
    end
  end

  def install
    bin.install Dir["lin-*"].first => "lin"
  end

  test do
    assert_match "0.8.1", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI", shell_output("#{bin}/lin --help")
  end
end
