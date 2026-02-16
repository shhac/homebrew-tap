class Prtea < Formula
  desc "A TUI for reviewing GitHub pull requests"
  homepage "https://github.com/shhac/prtea"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/prtea/releases/download/v0.4.0/prtea-darwin-arm64.tar.gz"
      sha256 "a527db86c396e91810a8fd74ea65b404c6f5fa1ae4008d84393f0c8f330f1ee1"
    end
    on_intel do
      url "https://github.com/shhac/prtea/releases/download/v0.4.0/prtea-darwin-amd64.tar.gz"
      sha256 "9dd919a784f75f3211e9cd101d727109addd332562d933d5fcc9aabc373739c2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/prtea/releases/download/v0.4.0/prtea-linux-arm64.tar.gz"
      sha256 "5d71ca18a3986048ea43e7bcffe41524e32bf5123ed0b0da0740b2a9f7a07b10"
    end
    on_intel do
      url "https://github.com/shhac/prtea/releases/download/v0.4.0/prtea-linux-amd64.tar.gz"
      sha256 "87e9af8c0b93fb41267c299b05a4d7008b96e76f58c7e0ab72cefbe0934ebea4"
    end
  end

  def install
    bin.install Dir["prtea-*"].first => "prtea"
  end

  test do
    assert_match "0.4.0", shell_output("#{bin}/prtea --version")
  end
end
