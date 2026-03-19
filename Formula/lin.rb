class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.10.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.10.1/lin-darwin-arm64.tar.gz"
      sha256 "3f4ee41901bff83c9f5e88b6909e1ef6e8d60e003573f9305cc4e514cc335e08"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.10.1/lin-darwin-x64.tar.gz"
      sha256 "758cfcaea3ba485c463355ecf0256ba4955e40b38915580905afc37ade1374aa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.10.1/lin-linux-arm64.tar.gz"
      sha256 "f77bc6bb1daaf9e07d75a5e5b1eb5fec1dd4bf96be952eda85f14502d970f29d"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.10.1/lin-linux-x64.tar.gz"
      sha256 "8b28f7499e9d45d61e092768d730998b8e5e29f4294c6125bc2d70de3e5b299a"
    end
  end

  def install
    bin.install Dir["lin-*"].first => "lin"
  end

  test do
    assert_match "0.10.1", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI", shell_output("#{bin}/lin --help")
  end
end
