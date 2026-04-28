class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.15.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.15.0/lin-darwin-arm64.tar.gz"
      sha256 "7d3beb9c612daca682fea7fcf3733a8c79a82240a486d959c0480dbe4f5ad37d"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.15.0/lin-darwin-amd64.tar.gz"
      sha256 "fed1796d891608840257a3b70ebf9d1e6fa2c883f1337e404f2f3e1dc0832db2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.15.0/lin-linux-arm64.tar.gz"
      sha256 "ca794de2005e61919447b616d1cb50f8bd39e9d5a92610253eca9fad1f84a07d"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.15.0/lin-linux-amd64.tar.gz"
      sha256 "363257b76b6d6eaddba9985f803510baa747fcd32491211a5ba8be2b466fbf6c"
    end
  end

  def install
    bin.install Dir["lin*"].first => "lin"
  end

  test do
    assert_match "0.15.0", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI", shell_output("#{bin}/lin --help")
  end
end
