class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.16.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.16.1/lin-darwin-arm64.tar.gz"
      sha256 "a82c22451fbb4b8455c178fd2f1f0ab7669add9f0a8957e94e7cdc73b80e5004"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.16.1/lin-darwin-amd64.tar.gz"
      sha256 "9eda936762f1f931cb252c863106acf410f2aed6f5f5f0914632143c3871e94e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.16.1/lin-linux-arm64.tar.gz"
      sha256 "7fe1c8ed289a5833fb6ab9aef7581b15e898a92d71271151d5af0643edf62eba"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.16.1/lin-linux-amd64.tar.gz"
      sha256 "846b8b6cfc9e1d4457c4e9a0e4bdabebf237f268e99eaa76cd126e95e172c145"
    end
  end

  def install
    bin.install Dir["lin*"].first => "lin"
  end

  test do
    assert_match "0.16.1", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI", shell_output("#{bin}/lin --help")
  end
end
