class Grotto < Formula
  desc "A permissive, user-friendly gRPC client"
  homepage "https://github.com/shhac/grotto"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/grotto/releases/download/v0.5.0/grotto_0.5.0_darwin_arm64.tar.gz"
      sha256 "3736bac86a17d60d26d3694894e32fe50d973afe9676113efc4add3ad713463c"
    end
    on_intel do
      url "https://github.com/shhac/grotto/releases/download/v0.5.0/grotto_0.5.0_darwin_amd64.tar.gz"
      sha256 "ca06d21dc229cb6eddba0d5be140dd7f39008ba7d560c91a708c8d1a9f189e84"
    end
  end

  def install
    bin.install "grotto"
  end

  test do
    assert_match "grotto", bin/"grotto"
  end
end
