class Grotto < Formula
  desc "A permissive, user-friendly gRPC client"
  homepage "https://github.com/shhac/grotto"
  version "0.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/grotto/releases/download/v0.6.1/grotto_0.6.1_darwin_arm64.tar.gz"
      sha256 "48fc2dd2e647dd1bc2a544a1027e75042f00a734593eb2e5a50c4ad36812c7fb"
    end
    on_intel do
      url "https://github.com/shhac/grotto/releases/download/v0.6.1/grotto_0.6.1_darwin_amd64.tar.gz"
      sha256 "4e4d1c6d4d324bac8bfbedb4d91d36b6c29971d218ec492ff063e05ae1ccdd40"
    end
  end

  def install
    bin.install "grotto"
  end

  test do
    assert_match "grotto", bin/"grotto"
  end
end
