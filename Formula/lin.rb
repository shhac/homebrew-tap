class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.19.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.19.0/lin-darwin-arm64.tar.gz"
      sha256 "3e9b6227df6efed2b59b768a029ed6b6b9dfcf93df83074dc7c23a549a98502a"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.19.0/lin-darwin-amd64.tar.gz"
      sha256 "1062ae0c21065983eaa095d7bd39c916cf219e178f90a624c2f04d88d360bb0e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.19.0/lin-linux-arm64.tar.gz"
      sha256 "d65920557e5050384e777ca89625c9840880d3b62d99029db2f76c3873d3f741"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.19.0/lin-linux-amd64.tar.gz"
      sha256 "ce5687a76d34a5d03c2368a725965681477310109b31c5afbfe8ac36c717d4ab"
    end
  end

  def install
    bin.install Dir["lin*"].first => "lin"
  end

  test do
    assert_match "0.19.0", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI", shell_output("#{bin}/lin --help")
  end
end
