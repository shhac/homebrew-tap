class Grotto < Formula
  desc "A permissive, user-friendly gRPC client"
  homepage "https://github.com/shhac/grotto"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/grotto/releases/download/v0.3.1/grotto_0.3.1_darwin_arm64.tar.gz"
      sha256 "6afe620b5353a6c309886cbbff8398f228b7555b0a674e5d5214eb6c0fae8f69"
    end
    on_intel do
      url "https://github.com/shhac/grotto/releases/download/v0.3.1/grotto_0.3.1_darwin_amd64.tar.gz"
      sha256 "d20fb6dff4e7532e0818faf2ba300613e51f63da281f5fdfcf8b03da3c12b708"
    end
  end

  def install
    bin.install "grotto"
  end

  test do
    assert_match "grotto", bin/"grotto"
  end
end
