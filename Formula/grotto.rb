class Grotto < Formula
  desc "A permissive, user-friendly gRPC client"
  homepage "https://github.com/shhac/grotto"
  version "0.7.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/grotto/releases/download/v0.7.1/grotto_0.7.1_darwin_arm64.tar.gz"
      sha256 "17db0a65fea366f988baf96775fff0b5691b2000f5bc11ba189ecf8b95e7f554"
    end
    on_intel do
      url "https://github.com/shhac/grotto/releases/download/v0.7.1/grotto_0.7.1_darwin_amd64.tar.gz"
      sha256 "8c984f0bf7ddf777135795d31184fdfccd0927f79dcf5d5ee19cb3c46b0742a3"
    end
  end

  def install
    bin.install "grotto"
  end

  test do
    assert_match "grotto", bin/"grotto"
  end
end
