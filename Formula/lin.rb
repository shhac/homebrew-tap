class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.11.0/lin-darwin-arm64.tar.gz"
      sha256 "33e6a1a49ec42d145f34892f5e423f84ef1ad1d6634d4eb14eb6233aeafdb498"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.11.0/lin-darwin-x64.tar.gz"
      sha256 "54cdb349ae3c72a11e8f66e7822cc29c3476ee996ab380ec05a38d720671d0ab"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.11.0/lin-linux-arm64.tar.gz"
      sha256 "418a882596860e477ad2d5ddea30b2b2d968ec7c6a8a14fd7e2d545280d0d8ab"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.11.0/lin-linux-x64.tar.gz"
      sha256 "47332b81e8f3418bcab111641cd9232b56646767cce81350f298a41aa494bbee"
    end
  end

  def install
    bin.install Dir["lin-*"].first => "lin"
  end

  test do
    assert_match "0.11.0", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI", shell_output("#{bin}/lin --help")
  end
end
