class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.3.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.3.3/lin-darwin-arm64.tar.gz"
      sha256 "13f42b07feb74635e412a8ff681cb7f45e0edf38f6aeb069c0fd58b7d889d625"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.3.3/lin-darwin-x64.tar.gz"
      sha256 "7b07a9f9872cdbedac3d9d4f1e2e0f0648190ea6061584c1bb25e0f9ed32e23c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.3.3/lin-linux-arm64.tar.gz"
      sha256 "f2711224ba3819f876f299623348f8c2033825bad27266f0ec8535b454751d60"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.3.3/lin-linux-x64.tar.gz"
      sha256 "e068162c2309ff6c1ae92ee47f14957b7d4605b78c6e07e7bae3369edb8f2a03"
    end
  end

  def install
    bin.install Dir["lin-*"].first => "lin"
  end

  test do
    assert_match "0.3.3", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI", shell_output("#{bin}/lin --help")
  end
end
