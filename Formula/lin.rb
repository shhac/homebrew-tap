class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.4.1/lin-darwin-arm64.tar.gz"
      sha256 "6f67c91a997038313720bc4d4154f2f77ba0b47534520542bd160ee1682eefda"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.4.1/lin-darwin-x64.tar.gz"
      sha256 "ed4adca9266606c2ea4e52065f73067245868cd9d343c5e47113b3abc0c62635"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.4.1/lin-linux-arm64.tar.gz"
      sha256 "05006894ba0c4dcfd7c557b08c70687298159a002d9fd4f89aa7778dc0f62e10"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.4.1/lin-linux-x64.tar.gz"
      sha256 "58a19f94840bc4542caf0861941c05c64dcc20c84549ea3966e490ef5be8894e"
    end
  end

  def install
    bin.install Dir["lin-*"].first => "lin"
  end

  test do
    assert_match "0.4.1", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI", shell_output("#{bin}/lin --help")
  end
end
