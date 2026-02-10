class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.1.0/lin-darwin-arm64.tar.gz"
      sha256 "11dacbee578ddbbabee940ab84c914d9e42680acc481ce40b917c4a5c2630c75"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.1.0/lin-darwin-x64.tar.gz"
      sha256 "a79a1a995da28ea6d79f5c668becb9520311f88993f246d45d4e7425e91b75c9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.1.0/lin-linux-arm64.tar.gz"
      sha256 "05430e7b3879a53956135d192f1db7f4f958aae51a06083d4c245fa9330a82a0"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.1.0/lin-linux-x64.tar.gz"
      sha256 "cb28a7bcbc3fd9fc2d4c6f78a7406b3d0bdae82c7217c63b695bfa6fe695f070"
    end
  end

  def install
    bin.install Dir["lin-*"].first => "lin"
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI", shell_output("#{bin}/lin --help")
  end
end
