class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.2.1/lin-darwin-arm64.tar.gz"
      sha256 "b0e7adc3b7ab11171a418932c70ad483d913a42404dd2ab792e5631d34708381"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.2.1/lin-darwin-x64.tar.gz"
      sha256 "e11c03a8cee663cf045a7ef0197d6ee4a3fa72977c5ab0b40f49a417436c7b09"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.2.1/lin-linux-arm64.tar.gz"
      sha256 "45d5e4c07927a380e6348b096cf407189f70d00ff1b1a7a8e660fcd3d81831bb"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.2.1/lin-linux-x64.tar.gz"
      sha256 "d5e6f0c2d8f5f85691a1361de937f884dbde795855babd6cabb6565880f095b9"
    end
  end

  def install
    bin.install Dir["lin-*"].first => "lin"
  end

  test do
    assert_match "0.2.1", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI", shell_output("#{bin}/lin --help")
  end
end
