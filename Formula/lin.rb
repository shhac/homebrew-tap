class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.3.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.3.4/lin-darwin-arm64.tar.gz"
      sha256 "31d3913d441aafd6c2d5bc47ef57503b8520e580c888048f3fa2b519ff0da931"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.3.4/lin-darwin-x64.tar.gz"
      sha256 "675de6d1391c5f7e587642cc4fdb4f30aacf9538ea6758e50d42ecd94ca1957c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.3.4/lin-linux-arm64.tar.gz"
      sha256 "d11a9c7333d4f9005fc924057a70dfc783868976c0dd9cb81eccf3f8af61e261"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.3.4/lin-linux-x64.tar.gz"
      sha256 "7989adf8c8988c3d52416e54fed3d1f4611cc7cdee6d900d361b388865e5b573"
    end
  end

  def install
    bin.install Dir["lin-*"].first => "lin"
  end

  test do
    assert_match "0.3.4", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI", shell_output("#{bin}/lin --help")
  end
end
