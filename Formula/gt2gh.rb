class Gt2gh < Formula
  desc "Bridge Graphite-managed linear stacks to GitHub native stacks"
  homepage "https://github.com/shhac/gt2gh"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/gt2gh/releases/download/v0.4.0/gt2gh-darwin-arm64.tar.gz"
      sha256 "d1aaa0f46be44fdcd482253f700db191f6013d0113a1c7f0aa30a705cadfe6b8"
    end
    on_intel do
      url "https://github.com/shhac/gt2gh/releases/download/v0.4.0/gt2gh-darwin-amd64.tar.gz"
      sha256 "31d771bd96dab8cacfc5284171c1e02c31b7d06d9c650fcaf355c618a30c6a17"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/gt2gh/releases/download/v0.4.0/gt2gh-linux-arm64.tar.gz"
      sha256 "ed0b3c1528a452020637692d98713ad7ddda09ed526be46eb808853913723b67"
    end
    on_intel do
      url "https://github.com/shhac/gt2gh/releases/download/v0.4.0/gt2gh-linux-amd64.tar.gz"
      sha256 "d597031c1665fa3772940c5c024004b14968f030239c4de5c8d1eb0221caa5f0"
    end
  end

  def install
    bin.install "gt2gh" => "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.4.0", shell_output("#{bin}/g2g --version")
    assert_match "Link a linear Graphite stack to GitHub", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
