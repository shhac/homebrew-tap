class Grotto < Formula
  desc "A permissive, user-friendly gRPC client"
  homepage "https://github.com/shhac/grotto"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/grotto/releases/download/v0.7.0/grotto_0.7.0_darwin_arm64.tar.gz"
      sha256 "b1a4e323fd70ca1afd3635daae9133884c0028b36cdccb698d9c52e78fca1a63"
    end
    on_intel do
      url "https://github.com/shhac/grotto/releases/download/v0.7.0/grotto_0.7.0_darwin_amd64.tar.gz"
      sha256 "83dd7d6dc0cc35f88caf11b99e7e2b97565165c909253fe0cc3e44faddd2bf25"
    end
  end

  def install
    bin.install "grotto"
  end

  test do
    assert_match "grotto", bin/"grotto"
  end
end
