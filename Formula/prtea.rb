class Prtea < Formula
  desc "A TUI for reviewing GitHub pull requests"
  homepage "https://github.com/shhac/prtea"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/prtea/releases/download/v0.2.0/prtea-darwin-arm64.tar.gz"
      sha256 "a071a50b69eedaa6eeba18784afe6bd8f9f8213a3ad66a4986ed966486a74742"
    end
    on_intel do
      url "https://github.com/shhac/prtea/releases/download/v0.2.0/prtea-darwin-amd64.tar.gz"
      sha256 "7cf73705b1032cc0ce9baeb25fda8474da8f1666fd88927e079355c2256d070f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/prtea/releases/download/v0.2.0/prtea-linux-arm64.tar.gz"
      sha256 "22b7afca42d09105ee807e9bc6d8486d89899df7dd12cf7f47224054976a4f96"
    end
    on_intel do
      url "https://github.com/shhac/prtea/releases/download/v0.2.0/prtea-linux-amd64.tar.gz"
      sha256 "291fd879b98fb347cb7fd1ba1ea1edca5c5f40a8070b0266ce5055c4bba6327f"
    end
  end

  def install
    bin.install Dir["prtea-*"].first => "prtea"
  end

  test do
    assert_match "0.2.0", shell_output("#{bin}/prtea --version")
  end
end
