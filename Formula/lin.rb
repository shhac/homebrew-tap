class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.12.0/lin-darwin-arm64.tar.gz"
      sha256 "6bc639c186274a8c4997f7cc8ac7b1c410a0e2bfecbd4b4fd20d3f3f06093408"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.12.0/lin-darwin-x64.tar.gz"
      sha256 "fe1925833711eb86554adbd67ac9674e6ec6d59ddb75ec666396cc9fadcae521"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.12.0/lin-linux-arm64.tar.gz"
      sha256 "77faa8e53fd2b74d0c9101ce9eaa1217d240b26c8c176739459cb01385b52670"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.12.0/lin-linux-x64.tar.gz"
      sha256 "5c593c6a2110c6fdc5413a81e1e707001adce764f669806bd562a8a4654bf033"
    end
  end

  def install
    bin.install Dir["lin-*"].first => "lin"
  end

  test do
    assert_match "0.12.0", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI", shell_output("#{bin}/lin --help")
  end
end
