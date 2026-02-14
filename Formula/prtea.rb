class Prtea < Formula
  desc "A TUI for reviewing GitHub pull requests"
  homepage "https://github.com/shhac/prtea"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/prtea/releases/download/v0.1.0/prtea-darwin-arm64.tar.gz"
      sha256 "254b2098af5fe28fbbf01a1d468db24c23ae0a4c44551c85171d32daee66e322"
    end
    on_intel do
      url "https://github.com/shhac/prtea/releases/download/v0.1.0/prtea-darwin-amd64.tar.gz"
      sha256 "da00ef2f6edf570bd759af1ce75ea59bbca233710ed5227355a8f2b7363fae47"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/prtea/releases/download/v0.1.0/prtea-linux-arm64.tar.gz"
      sha256 "f77e2c9c1947b76fe83242fde281b2300c810347c1f1c51c6e57631e95a8d217"
    end
    on_intel do
      url "https://github.com/shhac/prtea/releases/download/v0.1.0/prtea-linux-amd64.tar.gz"
      sha256 "dab3e2b4a2cb1aff089342a6f9d37575ec7103858b30984023ab882aa3838c6c"
    end
  end

  def install
    bin.install Dir["prtea-*"].first => "prtea"
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/prtea --version")
  end
end
