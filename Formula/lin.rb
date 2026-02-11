class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.3.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.3.7/lin-darwin-arm64.tar.gz"
      sha256 "56c8b084ee69cf8bbe3d7e181ffb8a2de9dc44448393731cd48bab7dfcd6b26d"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.3.7/lin-darwin-x64.tar.gz"
      sha256 "093fa672b7193fb2181512969a061248e8e4db7f73b47ace84d7185afd6ad92f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.3.7/lin-linux-arm64.tar.gz"
      sha256 "e8aa6c64e1fc660510da18647d051799595aee3444e039b1d3a3d3f10ced0eed"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.3.7/lin-linux-x64.tar.gz"
      sha256 "3a8d352bf8b7fe75010fd7de75a5a168f864f6e9a80b0005992fc550d59ab74f"
    end
  end

  def install
    bin.install Dir["lin-*"].first => "lin"
  end

  test do
    assert_match "0.3.7", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI", shell_output("#{bin}/lin --help")
  end
end
