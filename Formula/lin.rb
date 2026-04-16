class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.13.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.13.1/lin-darwin-arm64.tar.gz"
      sha256 "7f5387b8a9f284c9ae045a08fcb43cc473af0e8bc32bf85a8ca684179e5c5ac5"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.13.1/lin-darwin-amd64.tar.gz"
      sha256 "720eddd4c24a00a08269c8dc4b28a380dbfc213ad67f9e0b50ed2608fe69abd5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.13.1/lin-linux-arm64.tar.gz"
      sha256 "f45a756b38bb4fb848b5736cd1463f5908123ab46c5cad689f2ad4e62beb2f4a"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.13.1/lin-linux-amd64.tar.gz"
      sha256 "fd175df58181d5b3e8e920e477ecc17bd86cd2a5c74639f31e63dc623a66b6f4"
    end
  end

  def install
    bin.install Dir["lin*"].first => "lin"
  end

  test do
    assert_match "0.13.1", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI", shell_output("#{bin}/lin --help")
  end
end
