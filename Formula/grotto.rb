class Grotto < Formula
  desc "A permissive, user-friendly gRPC client"
  homepage "https://github.com/shhac/grotto"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/grotto/releases/download/v0.4.0/grotto_0.4.0_darwin_arm64.tar.gz"
      sha256 "717b16a6d6d30f6d6bbb0ca7a0d39e18238fa0a8cbc06b38f06f1b0719bdd0d5"
    end
    on_intel do
      url "https://github.com/shhac/grotto/releases/download/v0.4.0/grotto_0.4.0_darwin_amd64.tar.gz"
      sha256 "00f303872fba693e4ebfb7ade449e41d62672787cd9bf0784bd2babf652d550d"
    end
  end

  def install
    bin.install "grotto"
  end

  test do
    assert_match "grotto", bin/"grotto"
  end
end
