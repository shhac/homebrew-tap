class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.6.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.6.3/lin-darwin-arm64.tar.gz"
      sha256 "3957dc95d3022406a401510279d855a622400e02d3dc8bdf44e168ccb39663c5"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.6.3/lin-darwin-x64.tar.gz"
      sha256 "55537d5b8120b3c33f48cfda75d5220850f4a992c2e35304c4b5bf2ee550928b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.6.3/lin-linux-arm64.tar.gz"
      sha256 "c18a78cb88139e2fd2a1973ec3d62a1ee28d94c3ab65b122716aa12ca5df05b9"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.6.3/lin-linux-x64.tar.gz"
      sha256 "1066e2519383e9f5228bc762446e3199aa9e4d15667a7b946fb0ea612c50798a"
    end
  end

  def install
    bin.install Dir["lin-*"].first => "lin"
  end

  test do
    assert_match "0.6.3", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI", shell_output("#{bin}/lin --help")
  end
end
