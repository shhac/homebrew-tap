class Toss < Formula
  desc "Fast dice rolling CLI with colored output and reproducible rolls"
  homepage "https://github.com/shhac/toss"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/toss/releases/download/v0.6.0/toss-0.6.0-aarch64-macos.tar.gz"
      sha256 "755868d59bd75d962d1f5c2fd9e53057c93c481f2967b22881a9f6625063beb7"
    end
    on_intel do
      url "https://github.com/shhac/toss/releases/download/v0.6.0/toss-0.6.0-x86_64-macos.tar.gz"
      sha256 "bd120499278757c5a23de0f13fbb298623fa287f257d02e59f31fabfa12c7e79"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/toss/releases/download/v0.6.0/toss-0.6.0-aarch64-linux-gnu.tar.gz"
      sha256 "5ca5a02694b31ad1c6fc0de87bd1774bc61547200f93f09f9aa5a365ecfebd73"
    end
    on_intel do
      url "https://github.com/shhac/toss/releases/download/v0.6.0/toss-0.6.0-x86_64-linux-gnu.tar.gz"
      sha256 "b967726b1a5284c98a17d77c520321db0767a2ba634cd66d69fb3f9c7d47102f"
    end
  end

  def install
    # Archives contain a versioned directory around the binary.
    bin.install Dir["**/toss"].first
  end

  test do
    assert_match "toss 0.6.0", shell_output("#{bin}/toss --version")
    output = shell_output("#{bin}/toss --seed 42 1d6")
    assert_match(/\[.*1d6.*\]/, output)
  end
end
