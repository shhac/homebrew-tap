class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.17.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.17.0/lin-darwin-arm64.tar.gz"
      sha256 "2f151eca2f22f54840a54e92557c151825a574a382185860a2e8a26ce19b8850"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.17.0/lin-darwin-amd64.tar.gz"
      sha256 "f6f509dbc751dd01a869103ee252b33712852c66be153d9505ba72e468d4ab6e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.17.0/lin-linux-arm64.tar.gz"
      sha256 "647472f5e19888973bf926dea14046f2891627b0f5d5bc44ca45cec6f5e82436"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.17.0/lin-linux-amd64.tar.gz"
      sha256 "7e6c97105ddd6a7e8cf638cf121ad956692b20f3d02fd90104d1be1ff6e7328e"
    end
  end

  def install
    bin.install Dir["lin*"].first => "lin"
  end

  test do
    assert_match "0.17.0", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI", shell_output("#{bin}/lin --help")
  end
end
