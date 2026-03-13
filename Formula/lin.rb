class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.9.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.9.1/lin-darwin-arm64.tar.gz"
      sha256 "09c71a69cf328a231072b6e0b7a845209399024a97d3a83095888a76052135c3"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.9.1/lin-darwin-x64.tar.gz"
      sha256 "efc09779d3a2c65edf24e5f5dd3fe827f0199d2dd077bd085491f6e74512737d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.9.1/lin-linux-arm64.tar.gz"
      sha256 "7665e87fc1ed1d3a8326a2cf7dd813dd49bf185ead63afd2c58fcc9795f433b6"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.9.1/lin-linux-x64.tar.gz"
      sha256 "884a0ab6f3f60786a86fdbf945009adb6d5624c9a5484cfd0f339ac7cac7f6c0"
    end
  end

  def install
    bin.install Dir["lin-*"].first => "lin"
  end

  test do
    assert_match "0.9.1", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI", shell_output("#{bin}/lin --help")
  end
end
