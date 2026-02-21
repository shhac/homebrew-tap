class Grotto < Formula
  desc "A permissive, user-friendly gRPC client"
  homepage "https://github.com/shhac/grotto"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/grotto/releases/download/v0.2.0/grotto_0.2.0_darwin_arm64.tar.gz"
      sha256 "6bea3213fcacddfd6e8ae73b58cd57234940337df866ca8b6825bd8a81c1e7ae"
    end
    on_intel do
      url "https://github.com/shhac/grotto/releases/download/v0.2.0/grotto_0.2.0_darwin_amd64.tar.gz"
      sha256 "1da8e778a4a624affd5bb69c0172a733dd277af4ca45d6e0c8d18314cfa5d87a"
    end
  end

  def install
    bin.install "grotto"
  end

  test do
    assert_match "grotto", bin/"grotto"
  end
end
