class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.20.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.20.0/lin-darwin-arm64.tar.gz"
      sha256 "93ab432024b2eb313552b79d35b10cc80619abd3ae645d1a3b468118a7f7bf04"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.20.0/lin-darwin-amd64.tar.gz"
      sha256 "da0b42773f85957810baf6146561edfe00fdf09e424f1ead6b12550e8750a029"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.20.0/lin-linux-arm64.tar.gz"
      sha256 "6173ad204cd623575cc1dc77a9476f21e33768c9395824085c720d3f983e5cbc"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.20.0/lin-linux-amd64.tar.gz"
      sha256 "48221288987b75b612d4242a2d067a3673c65da886ff9630e16a44345c8b4149"
    end
  end

  def install
    bin.install Dir["lin*"].first => "lin"
  end

  test do
    assert_match "0.20.0", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI", shell_output("#{bin}/lin --help")
  end
end
