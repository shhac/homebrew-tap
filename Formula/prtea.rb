class Prtea < Formula
  desc "A TUI for reviewing GitHub pull requests"
  homepage "https://github.com/shhac/prtea"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/prtea/releases/download/v0.6.0/prtea-darwin-arm64.tar.gz"
      sha256 "f7832d447dedc78855dfd79886c354a0fd773b8f96e2601c249e23aba4e05b43"
    end
    on_intel do
      url "https://github.com/shhac/prtea/releases/download/v0.6.0/prtea-darwin-amd64.tar.gz"
      sha256 "6a0922052cfb3188267b9a8cbf9b499882bc7c90f99d665ac7ff5835f1c3466f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/prtea/releases/download/v0.6.0/prtea-linux-arm64.tar.gz"
      sha256 "4524f844580aa12f27bb210930bd756957b3d54472cff0f50ecec698bca94edd"
    end
    on_intel do
      url "https://github.com/shhac/prtea/releases/download/v0.6.0/prtea-linux-amd64.tar.gz"
      sha256 "1f7df53ce515d81d4b44c6eb01299c12f0b0b8c1fc49405250fb0d7448ac9a71"
    end
  end

  def install
    bin.install Dir["prtea-*"].first => "prtea"
  end

  test do
    assert_match "0.6.0", shell_output("#{bin}/prtea --version")
  end
end
