class Toss < Formula
  desc "Fast dice rolling CLI with colored output and reproducible rolls"
  homepage "https://github.com/shhac/toss"
  version "0.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/toss/releases/download/v0.5.1/toss-0.5.1-aarch64-macos.tar.gz"
      sha256 "f70c94e142754535ccd7659da7f32daa1d9693a15258551405a5752319249a01"
    end
    on_intel do
      url "https://github.com/shhac/toss/releases/download/v0.5.1/toss-0.5.1-x86_64-macos.tar.gz"
      sha256 "789e2e186ae2dee63036d2d0e5581a91051f72c513801d4d558e6497dae4f417"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/toss/releases/download/v0.5.1/toss-0.5.1-aarch64-linux-gnu.tar.gz"
      sha256 "d9577be03a533db11a7e2a023c92f9f6d81c73b2ea29824575b260e0f52eeb50"
    end
    on_intel do
      url "https://github.com/shhac/toss/releases/download/v0.5.1/toss-0.5.1-x86_64-linux-gnu.tar.gz"
      sha256 "8880282a7680970c4ef3a5b3a71b6f3793ee93a068acb3dd78a6999499ed0fdb"
    end
  end

  def install
    # Find the toss binary in the extracted directory
    binary = Dir["**/toss"].first
    bin.install binary
  end

  test do
    assert_match "toss 0.5.1", shell_output("#{bin}/toss --version")
    output = shell_output("#{bin}/toss --seed 42 1d6")
    assert_match(/\[.*1d6.*\]/, output)
  end
end
