class Grotto < Formula
  desc "A permissive, user-friendly gRPC client"
  homepage "https://github.com/shhac/grotto"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/grotto/releases/download/v0.6.0/grotto_0.6.0_darwin_arm64.tar.gz"
      sha256 "ef88eca3c625ec97b527c93b16f9a6f8a88ab6fc0b54748e6b28fcd351b423e5"
    end
    on_intel do
      url "https://github.com/shhac/grotto/releases/download/v0.6.0/grotto_0.6.0_darwin_amd64.tar.gz"
      sha256 "8ff6680f202cc1850c31d9c08f3b024a4dd419b186583396d62b3e61f7c1f474"
    end
  end

  def install
    bin.install "grotto"
  end

  test do
    assert_match "grotto", bin/"grotto"
  end
end
