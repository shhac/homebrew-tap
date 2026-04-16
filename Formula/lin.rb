class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.13.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.13.0/lin-darwin-arm64.tar.gz"
      sha256 "d0595fbfdef6a67c86c021b5e4fefeb6cd22db2572daacf70c8750e6b66e0d05"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.13.0/lin-darwin-amd64.tar.gz"
      sha256 "af1ce4bf7f00188eb3f497d4a3fba15d3d47c63b3761447dfbae183d4ad8209e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.13.0/lin-linux-arm64.tar.gz"
      sha256 "0fa17611ec108a6cee1115d61f698c1c04488a4092011d712c81b4ad2460c41d"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.13.0/lin-linux-amd64.tar.gz"
      sha256 "72372f47e6d7a2a0e4815dd3386eb16a735b9f082b4b0d19fee2941cebd37492"
    end
  end

  def install
    bin.install Dir["lin*"].first => "lin"
  end

  test do
    assert_match "0.13.0", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI", shell_output("#{bin}/lin --help")
  end
end
