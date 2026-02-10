class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.3.1/lin-darwin-arm64.tar.gz"
      sha256 "cfdc7f3efb6860a3457225c75bddf9fc5fbd66570bbdeb98be9f08b95bff6e14"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.3.1/lin-darwin-x64.tar.gz"
      sha256 "d6e9e78608ba8774c14022ae5c3c03d8107a2cc6aadd4255f12e8c6f0a1dbb30"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.3.1/lin-linux-arm64.tar.gz"
      sha256 "e031f8006e2be73131c2429ecabb6be357562f33c2e3d5929cab80ee10353047"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.3.1/lin-linux-x64.tar.gz"
      sha256 "4a53f712f7a99839991856aaedf6e9575fa42f04ba8bd0f793ceb6418cc29aa6"
    end
  end

  def install
    bin.install Dir["lin-*"].first => "lin"
  end

  test do
    assert_match "0.3.1", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI", shell_output("#{bin}/lin --help")
  end
end
