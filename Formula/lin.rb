class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.3.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.3.6/lin-darwin-arm64.tar.gz"
      sha256 "1f104219d57bfcaca4227cd3d3e91f2fa11129b1341e27bba5617469e6572967"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.3.6/lin-darwin-x64.tar.gz"
      sha256 "390351d71cb91b95e4d90e6ad1db5679fb4afc019fb0f9ad5373153eee2dec69"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.3.6/lin-linux-arm64.tar.gz"
      sha256 "1fa146a4905c446e93f138276c7943abb58bc7f9058a159edecd3251306625e5"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.3.6/lin-linux-x64.tar.gz"
      sha256 "8196a240eeb65da37eea3b5e3043e59062fd3efa3ccc40353e607f01cddfc69c"
    end
  end

  def install
    bin.install Dir["lin-*"].first => "lin"
  end

  test do
    assert_match "0.3.6", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI", shell_output("#{bin}/lin --help")
  end
end
