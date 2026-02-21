class Grotto < Formula
  desc "A permissive, user-friendly gRPC client"
  homepage "https://github.com/shhac/grotto"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/grotto/releases/download/v0.2.1/grotto_0.2.1_darwin_arm64.tar.gz"
      sha256 "1a1206811e48821864999d3af4ea945b262a362b20fcb3215b96e611b846364f"
    end
    on_intel do
      url "https://github.com/shhac/grotto/releases/download/v0.2.1/grotto_0.2.1_darwin_amd64.tar.gz"
      sha256 "f5e33ad6abd69b1bd675f53a97914d0d402a1e0b5579193c39092b5b85e6c6a1"
    end
  end

  def install
    bin.install "grotto"
  end

  test do
    assert_match "grotto", bin/"grotto"
  end
end
