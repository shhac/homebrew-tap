class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.3.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.3.2/lin-darwin-arm64.tar.gz"
      sha256 "a2396df939844509c41e2431341c346779ca6b59c97ff88e307909707c593b8c"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.3.2/lin-darwin-x64.tar.gz"
      sha256 "7685c2f9948ba249a18a88a110da729c7b97e10d68e23db994cde9c2ee42b9cf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.3.2/lin-linux-arm64.tar.gz"
      sha256 "ee6bdfd4f75187737fec49584e601179c5296454da59c54cadc7621b1a75cbaf"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.3.2/lin-linux-x64.tar.gz"
      sha256 "755b627818e76c296f2e3854a55c9e74879b7dca160d190e0b046a84067f91fb"
    end
  end

  def install
    bin.install Dir["lin-*"].first => "lin"
  end

  test do
    assert_match "0.3.2", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI", shell_output("#{bin}/lin --help")
  end
end
