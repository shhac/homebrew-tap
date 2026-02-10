class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.3.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.3.5/lin-darwin-arm64.tar.gz"
      sha256 "94b5539bd1c6ecd671dc5baa118ed94ec2fc27db68621a64c5ff07efeca33cdf"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.3.5/lin-darwin-x64.tar.gz"
      sha256 "b35c294bce308704e2b5c2eb929a19b3b644d1f75e1f70c48807f6f7a82f0f6a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.3.5/lin-linux-arm64.tar.gz"
      sha256 "7abde424024094d241367f23eb1d8588aff21a4d0e3e63c342ba5a860c828dbd"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.3.5/lin-linux-x64.tar.gz"
      sha256 "0add9083eb307d43e3f39c9a8c408de616913c785928523cb25c2e9b69f08f87"
    end
  end

  def install
    bin.install Dir["lin-*"].first => "lin"
  end

  test do
    assert_match "0.3.5", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI", shell_output("#{bin}/lin --help")
  end
end
