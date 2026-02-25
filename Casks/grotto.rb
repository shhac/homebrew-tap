cask "grotto" do
  version "0.8.0"

  on_arm do
    url "https://github.com/shhac/grotto/releases/download/v#{version}/Grotto_darwin_arm64.zip"
    sha256 "031d8c05b7fb2827636e4b45ba8ad577cd9d8dd9556805a997339b829122201c"
  end
  on_intel do
    url "https://github.com/shhac/grotto/releases/download/v#{version}/Grotto_darwin_amd64.zip"
    sha256 "a3ff85af3ee963a15f089451448b34252e26c260d5f297b7299c74144e39745d"
  end

  name "Grotto"
  desc "A permissive, user-friendly gRPC client"
  homepage "https://github.com/shhac/grotto"

  app "Grotto.app"
  binary "Grotto.app/Contents/MacOS/grotto"

  # Strip quarantine flag — app is unsigned
  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/Grotto.app"]
  end

  zap trash: [
    "~/Library/Preferences/com.grotto.client.plist",
  ]
end
