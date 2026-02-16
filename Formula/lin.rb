class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.6.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.6.2/lin-darwin-arm64.tar.gz"
      sha256 "790e380b4468b7833327b5c0c208fd963968072b27708bb0ca34b3acb0732276"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.6.2/lin-darwin-x64.tar.gz"
      sha256 "f42a3fe1c0d6d879a6d4a701a63bca2b936fe604ecc1bd02a1193b96a7c9e045"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.6.2/lin-linux-arm64.tar.gz"
      sha256 "b390af22a70431cf1b84e6f95ca981b829caeb31444716371d21c31d7f2fb601"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.6.2/lin-linux-x64.tar.gz"
      sha256 "b815b908bdde6870e8bd5928cd8c9cccf3196ca80a43546a7e3d745faf019d94"
    end
  end

  def install
    bin.install Dir["lin-*"].first => "lin"
  end

  test do
    assert_match "0.6.2", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI", shell_output("#{bin}/lin --help")
  end
end
