class Grotto < Formula
  desc "A permissive, user-friendly gRPC client"
  homepage "https://github.com/shhac/grotto"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/grotto/releases/download/v0.3.0/grotto_0.3.0_darwin_arm64.tar.gz"
      sha256 "98eca5cb002a53f6c224ec7bcb2260d26c00fb19004149ef3db77685b741bb0f"
    end
    on_intel do
      url "https://github.com/shhac/grotto/releases/download/v0.3.0/grotto_0.3.0_darwin_amd64.tar.gz"
      sha256 "c1c4072a084e8a0b2419e74b0b957cd36e608102e8c63cedb43fefd07affec2b"
    end
  end

  def install
    bin.install "grotto"
  end

  test do
    assert_match "grotto", bin/"grotto"
  end
end
