class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.3.0/lin-darwin-arm64.tar.gz"
      sha256 "1f70145319e2015e3a826cd93c484e789fb530dde1f3970996afce696918897d"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.3.0/lin-darwin-x64.tar.gz"
      sha256 "d50ef6ba4f828967cc4c5750c58e4be33ca6df7b4d381f1a35ef0cbf0d7f1680"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.3.0/lin-linux-arm64.tar.gz"
      sha256 "363dba3583d9dcd6c80bd63ff14b86b8aaa5978d82f37a75dbccc3ceaeb1fcad"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.3.0/lin-linux-x64.tar.gz"
      sha256 "9eefc6403c6f1df5d1e69b8e3da2d9c8e5f73f45d2f0f1d4c821524f24aa618e"
    end
  end

  def install
    bin.install Dir["lin-*"].first => "lin"
  end

  test do
    assert_match "0.3.0", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI", shell_output("#{bin}/lin --help")
  end
end
