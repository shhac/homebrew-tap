class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.9.0/lin-darwin-arm64.tar.gz"
      sha256 "be70cade52971bc5839762dd770bbe3938e22b963b36e06653ef7f70241136c7"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.9.0/lin-darwin-x64.tar.gz"
      sha256 "0a2756c73dc7a5cbfb0e73989575f1e2ac4b9eac35e6dfe821ed0619b4f7aa0f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.9.0/lin-linux-arm64.tar.gz"
      sha256 "39d16d81d037888415c860158a700015d5d4601dace1a90ea19e4d807068c698"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.9.0/lin-linux-x64.tar.gz"
      sha256 "cd1da4f71faf5d0b66beee166fded5856318f20443b5d8cef6509f2496a8dcb8"
    end
  end

  def install
    bin.install Dir["lin-*"].first => "lin"
  end

  test do
    assert_match "0.9.0", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI", shell_output("#{bin}/lin --help")
  end
end
