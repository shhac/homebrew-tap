cask "grotto" do
  version "0.7.1"

  on_arm do
    url "https://github.com/shhac/grotto/releases/download/v#{version}/Grotto_#{version}_darwin_arm64.zip"
    sha256 "PLACEHOLDER_ARM64"
  end
  on_intel do
    url "https://github.com/shhac/grotto/releases/download/v#{version}/Grotto_#{version}_darwin_amd64.zip"
    sha256 "PLACEHOLDER_AMD64"
  end

  name "Grotto"
  desc "A permissive, user-friendly gRPC client"
  homepage "https://github.com/shhac/grotto"

  app "Grotto.app"
  binary "Grotto.app/Contents/MacOS/grotto"

  zap trash: [
    "~/Library/Preferences/com.grotto.client.plist",
  ]
end
