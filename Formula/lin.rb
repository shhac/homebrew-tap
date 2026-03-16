class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.10.0/lin-darwin-arm64.tar.gz"
      sha256 "693ba4b467f9d82625d45b95e79c9831ebbeca0b684a2b4b3281064da5902385"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.10.0/lin-darwin-x64.tar.gz"
      sha256 "f03e480466ecb1379f532ab915fb350994133f95a9b2e2fff9ebfb0c384af491"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.10.0/lin-linux-arm64.tar.gz"
      sha256 "e34ab1f988fde7a2059f530364a4140faa905ffba2ad510c19ea1fd9f447bb7d"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.10.0/lin-linux-x64.tar.gz"
      sha256 "720953313262700c5e2a911a0fe9ec4060959095063f83e49a004136b98abd7a"
    end
  end

  def install
    bin.install Dir["lin-*"].first => "lin"
  end

  test do
    assert_match "0.10.0", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI", shell_output("#{bin}/lin --help")
  end
end
