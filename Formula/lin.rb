class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.6.1/lin-darwin-arm64.tar.gz"
      sha256 "f20c4636a4455037d2071badfaa52c637118e947a4360e385832e99042af3507"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.6.1/lin-darwin-x64.tar.gz"
      sha256 "405cc868d2fd39e3ff34a85a3949d7fa63bc96919f22c9e8b16a1861e02c990f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.6.1/lin-linux-arm64.tar.gz"
      sha256 "da2d6d30bc2ef717f50c86e1385a9f445e2f77de0c4a46a105bb11887b8c8613"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.6.1/lin-linux-x64.tar.gz"
      sha256 "4338ab5801250a7801c32745d428a349cf02cbc81fc433bbb349290c319557f7"
    end
  end

  def install
    bin.install Dir["lin-*"].first => "lin"
  end

  test do
    assert_match "0.6.1", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI", shell_output("#{bin}/lin --help")
  end
end
