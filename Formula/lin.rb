class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.16.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.16.0/lin-darwin-arm64.tar.gz"
      sha256 "29324633e08204a7858624724e52b3be1f54ba944b7f1b76b6d7fa416faad137"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.16.0/lin-darwin-amd64.tar.gz"
      sha256 "757dc9ea90b7bcb5371a26676b2b58a31276df8f1fa68edbfdb742827da24adb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.16.0/lin-linux-arm64.tar.gz"
      sha256 "cc4be65bfa9e48cee929f2df4ff88d08be7118ba066c38cbe98d12bf3df729c7"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.16.0/lin-linux-amd64.tar.gz"
      sha256 "e6d927ab1cffb683e5a2bff05e729abfb8d146b052bcc6e8837d096430065403"
    end
  end

  def install
    bin.install Dir["lin*"].first => "lin"
  end

  test do
    assert_match "0.16.0", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI", shell_output("#{bin}/lin --help")
  end
end
