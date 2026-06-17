class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.18.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.18.0/lin-darwin-arm64.tar.gz"
      sha256 "801c1089609e60b6f039084d02c0bb7dc3f4a486d4000130eb0f84335acd01e4"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.18.0/lin-darwin-amd64.tar.gz"
      sha256 "63b0bd086f4cca83f08ba35173045125260163a86f92ed4d6edd598b6b3b8090"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.18.0/lin-linux-arm64.tar.gz"
      sha256 "bc3f30801495514f873834dc560acec3375142d088f4e9a89f7ef294869ac142"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.18.0/lin-linux-amd64.tar.gz"
      sha256 "1768e3b60e87bbe5e0046d39b08ce8be2973ab4c6eda4631e8bb1795dd2d472e"
    end
  end

  def install
    bin.install Dir["lin*"].first => "lin"
  end

  test do
    assert_match "0.18.0", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI", shell_output("#{bin}/lin --help")
  end
end
