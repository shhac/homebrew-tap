class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.2.0/lin-darwin-arm64.tar.gz"
      sha256 "78b1520bea7ba58846a3ebc1bb448de4f7fac206a435d9c83e839a0985716ff5"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.2.0/lin-darwin-x64.tar.gz"
      sha256 "c8a30ecbeabe85d93c0a45e40bca467d02fbc3c6313f028f71b61f76d0beb174"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.2.0/lin-linux-arm64.tar.gz"
      sha256 "d2ea36b5f365865aaabf3067471b1d8d9cc19f2caa7d18ff44d0b68f5bc26577"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.2.0/lin-linux-x64.tar.gz"
      sha256 "3f29b6edc7714400eb28cdb65f3b61bc29c4e6bed3eaba4f81f57c669ff0e1b3"
    end
  end

  def install
    bin.install Dir["lin-*"].first => "lin"
  end

  test do
    assert_match "0.2.0", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI", shell_output("#{bin}/lin --help")
  end
end
