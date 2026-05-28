class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.16.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.16.2/lin-darwin-arm64.tar.gz"
      sha256 "d523ec0ed85dcd9f73d03c7ebf1df44b28adf7067e0d5e558ff352f5efbd436a"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.16.2/lin-darwin-amd64.tar.gz"
      sha256 "0103b6d7327fd41e79039d97908c30142b178637813031c26a9a695c1e08882e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.16.2/lin-linux-arm64.tar.gz"
      sha256 "7d28fbafa0a772cadd1f246fe2149ea3086d70e7c08048d02676cdb9472650e0"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.16.2/lin-linux-amd64.tar.gz"
      sha256 "d14b8309db976800f004322831d3341d3c02e07c722d921d818ff5aee20c89a4"
    end
  end

  def install
    bin.install Dir["lin*"].first => "lin"
  end

  test do
    assert_match "0.16.2", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI", shell_output("#{bin}/lin --help")
  end
end
