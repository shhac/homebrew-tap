class Prtea < Formula
  desc "A TUI for reviewing GitHub pull requests"
  homepage "https://github.com/shhac/prtea"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/prtea/releases/download/v0.5.0/prtea-darwin-arm64.tar.gz"
      sha256 "3e10e24624ab7e33a1037af4e33712d8d6f94b6217f3007f42a4a1688b60cb36"
    end
    on_intel do
      url "https://github.com/shhac/prtea/releases/download/v0.5.0/prtea-darwin-amd64.tar.gz"
      sha256 "24b00ad467fc5627e58fd94ccb34a09452d454600a698bab80a56040d8f93465"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/prtea/releases/download/v0.5.0/prtea-linux-arm64.tar.gz"
      sha256 "ef84b29c26e67615dd122d80a691f4ed6f6ed1f976da5a29d77bf886914fdbc0"
    end
    on_intel do
      url "https://github.com/shhac/prtea/releases/download/v0.5.0/prtea-linux-amd64.tar.gz"
      sha256 "2e307674a980f736da27da75e68352d08bcc27a06b435b616127a23abe1aaf63"
    end
  end

  def install
    bin.install Dir["prtea-*"].first => "prtea"
  end

  test do
    assert_match "0.5.0", shell_output("#{bin}/prtea --version")
  end
end
