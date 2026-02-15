class Prtea < Formula
  desc "A TUI for reviewing GitHub pull requests"
  homepage "https://github.com/shhac/prtea"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/prtea/releases/download/v0.1.1/prtea-darwin-arm64.tar.gz"
      sha256 "0d57bd44c1dc54afe7425f0e62d4a00392b67ebc8f1395611e19f47cbf7a8fd8"
    end
    on_intel do
      url "https://github.com/shhac/prtea/releases/download/v0.1.1/prtea-darwin-amd64.tar.gz"
      sha256 "f1872b59770f2ef51e63cc87a226485eb683ca0f7708f4ae4b5112bd755102b7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/prtea/releases/download/v0.1.1/prtea-linux-arm64.tar.gz"
      sha256 "1e8d880c39841abfa849703de6d5c075fe32f717596a620718861bdd7a51bcb0"
    end
    on_intel do
      url "https://github.com/shhac/prtea/releases/download/v0.1.1/prtea-linux-amd64.tar.gz"
      sha256 "afe2a391f6a3397d646bdbc9c35c9e778ef433b0296b027c06e3c98afa90cf5f"
    end
  end

  def install
    bin.install Dir["prtea-*"].first => "prtea"
  end

  test do
    assert_match "0.1.1", shell_output("#{bin}/prtea --version")
  end
end
