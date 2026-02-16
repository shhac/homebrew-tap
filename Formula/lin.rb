class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.6.0/lin-darwin-arm64.tar.gz"
      sha256 "0b4e9b13aa2a93182205f3cedad9296f2fbaf894d5f76db1c9e52df704d7a189"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.6.0/lin-darwin-x64.tar.gz"
      sha256 "010cf1dd9c55fa222bd67ae642a856fb338ef5172c26247cbbcf99f662aedd12"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.6.0/lin-linux-arm64.tar.gz"
      sha256 "e220bd8db5626810d529aa20096523d81684c7a808b27ea0ecc7a2ef9f862911"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.6.0/lin-linux-x64.tar.gz"
      sha256 "4c263c3db49176b0f5f789d048b540f47fc189c54fed88e3d7ade4d65f9868e8"
    end
  end

  def install
    bin.install Dir["lin-*"].first => "lin"
  end

  test do
    assert_match "0.6.0", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI", shell_output("#{bin}/lin --help")
  end
end
