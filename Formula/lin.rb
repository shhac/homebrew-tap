class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.8.0/lin-darwin-arm64.tar.gz"
      sha256 "13fbed911424566c8d7dae9463353494d3fb7e9f48e14c3803a468a53416c544"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.8.0/lin-darwin-x64.tar.gz"
      sha256 "b430ae98a478dee906527f1ee02f9ec721caff8354559b09c0f3d9c045f486d2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.8.0/lin-linux-arm64.tar.gz"
      sha256 "290d5a0520db80d00ba0c31d40a2cc307af642b0902ef94cb5037fb32e111296"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.8.0/lin-linux-x64.tar.gz"
      sha256 "bc2c01972718c191fcb4448557ccec2f633934d505f73c537dc2625f362d79d9"
    end
  end

  def install
    bin.install Dir["lin-*"].first => "lin"
  end

  test do
    assert_match "0.8.0", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI", shell_output("#{bin}/lin --help")
  end
end
