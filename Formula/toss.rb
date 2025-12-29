class Toss < Formula
  desc "Fast dice rolling CLI with colored output and reproducible rolls"
  homepage "https://github.com/shhac/toss"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/toss/releases/download/v0.5.0/toss-0.5.0-aarch64-macos.tar.gz"
      sha256 "dbff47a9a7981aaf9530d5510d272aba784688e8166088231342909d23b6af01"
    end
    on_intel do
      url "https://github.com/shhac/toss/releases/download/v0.5.0/toss-0.5.0-x86_64-macos.tar.gz"
      sha256 "1d29571a4731fd9a9b9bca58616ee6b5727e9a749545a6894315e2d13d101c62"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/toss/releases/download/v0.5.0/toss-0.5.0-aarch64-linux-gnu.tar.gz"
      sha256 "69ad58d61a6f23afc5fc7a3901163c646e7fd996cc9d1d7e79af1b3496b24252"
    end
    on_intel do
      url "https://github.com/shhac/toss/releases/download/v0.5.0/toss-0.5.0-x86_64-linux-gnu.tar.gz"
      sha256 "8f241c1d5416bc6ff42b7db2a1d3d74ad17e5cb35536affe01ab8b9fe8f9fba7"
    end
  end

  def install
    # Find the toss binary in the extracted directory
    binary = Dir["**/toss"].first
    bin.install binary
  end

  test do
    assert_match "toss 0.5.0", shell_output("#{bin}/toss --version")
    output = shell_output("#{bin}/toss --seed 42 1d6")
    assert_match(/\[.*1d6.*\]/, output)
  end
end
