class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.12.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.12.1/lin-darwin-arm64.tar.gz"
      sha256 "dde37a9cf073a985df0626b50508ecf03ec25fc965970f6b16d9d6c6a729e96c"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.12.1/lin-darwin-x64.tar.gz"
      sha256 "ca66425d62f1847b4eb3a0582ad807ff4498c601f637d7b71dd3509165d70d4e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.12.1/lin-linux-arm64.tar.gz"
      sha256 "20da1642b642cda0f4a7069eb4a2bef5fb9a62cbfecda82794a123413e85fa95"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.12.1/lin-linux-x64.tar.gz"
      sha256 "d6935e7e18248df78a49557dd17d317cb0d9487e40f86b92558a697bc1092c29"
    end
  end

  def install
    bin.install Dir["lin-*"].first => "lin"
  end

  test do
    assert_match "0.12.1", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI", shell_output("#{bin}/lin --help")
  end
end
