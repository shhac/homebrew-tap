class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.14.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.14.0/lin-darwin-arm64.tar.gz"
      sha256 "f766c3996db05cb8ba5c1e6e755855c97b9d37cfc53a16e337f341e8a8c98aa8"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.14.0/lin-darwin-amd64.tar.gz"
      sha256 "80946f9bd1885555f17d70fb23b5f593a44dc804e0fecc67e438f9b34a8692df"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.14.0/lin-linux-arm64.tar.gz"
      sha256 "3d75f94bdc5d19b7133bc2777951d0ecb4c7ccab01028e35169df80bc9199c9b"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.14.0/lin-linux-amd64.tar.gz"
      sha256 "3f7da3ecef0fafd4a5ee4252dafd55805a61545990c26cb334614856cd028970"
    end
  end

  def install
    bin.install Dir["lin*"].first => "lin"
  end

  test do
    assert_match "0.14.0", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI", shell_output("#{bin}/lin --help")
  end
end
