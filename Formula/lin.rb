class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.4.0/lin-darwin-arm64.tar.gz"
      sha256 "0a0b3d1094ec47165afeb398f45c15be1da726b2576d539691e53fb0d6928298"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.4.0/lin-darwin-x64.tar.gz"
      sha256 "51af2c03a0c3e76fd4d2d8e27628a5917d871f931ff5e319fc0b122f6d2c25b6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.4.0/lin-linux-arm64.tar.gz"
      sha256 "1aa4af1293d439b360476489f1a31a31c3bb11542e7a473d8a050c9f812986ea"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.4.0/lin-linux-x64.tar.gz"
      sha256 "3da59fcce4271e553cfaf543d69c717a2592e3005c95001635204172794d8ad1"
    end
  end

  def install
    bin.install Dir["lin-*"].first => "lin"
  end

  test do
    assert_match "0.4.0", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI", shell_output("#{bin}/lin --help")
  end
end
