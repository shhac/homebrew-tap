class Grotto < Formula
  desc "A permissive, user-friendly gRPC client"
  homepage "https://github.com/shhac/grotto"
  version "0.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/grotto/releases/download/v0.2.2/grotto_0.2.2_darwin_arm64.tar.gz"
      sha256 "c5943203cacb7e91caac6872fa5da26afc451a62b2554dcb209bc07d9329da7a"
    end
    on_intel do
      url "https://github.com/shhac/grotto/releases/download/v0.2.2/grotto_0.2.2_darwin_amd64.tar.gz"
      sha256 "204b744832e0c996ea0682b668e3b232eb9c5c60c961db4595919ed7636da90a"
    end
  end

  def install
    bin.install "grotto"
  end

  test do
    assert_match "grotto", bin/"grotto"
  end
end
