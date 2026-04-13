class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.12.0/lin-darwin-arm64.tar.gz"
      sha256 "c79dbd0db767ddc8c5f1e142e17e2c0684037cbc922200a722f14632e657aaf8"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.12.0/lin-darwin-x64.tar.gz"
      sha256 "b94efe1397b238e42f96a68bfbacaa802728a34a6320024f340f919783b14f1c"
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
