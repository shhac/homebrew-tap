class Prtea < Formula
  desc "A TUI for reviewing GitHub pull requests"
  homepage "https://github.com/shhac/prtea"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/prtea/releases/download/v0.3.0/prtea-darwin-arm64.tar.gz"
      sha256 "2bd06c4cfdc85b03756a393764cc332ed9542403277547117df0ec83a0accebe"
    end
    on_intel do
      url "https://github.com/shhac/prtea/releases/download/v0.3.0/prtea-darwin-amd64.tar.gz"
      sha256 "98b0b2dbc43527151c189987fa85c0ba8fd71cae69c29157baa9206ce952af5d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/prtea/releases/download/v0.3.0/prtea-linux-arm64.tar.gz"
      sha256 "74aace055158697672e9a241f1ec9eaf0ecd9f831dbe86e89cea5b6dba1013e7"
    end
    on_intel do
      url "https://github.com/shhac/prtea/releases/download/v0.3.0/prtea-linux-amd64.tar.gz"
      sha256 "611f16a4dfeb250daf455b575c8e9c0ea960ff812548a85d60fd7d0ac03875d5"
    end
  end

  def install
    bin.install Dir["prtea-*"].first => "prtea"
  end

  test do
    assert_match "0.3.0", shell_output("#{bin}/prtea --version")
  end
end
