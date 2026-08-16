class Gt2gh < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/gt2gh"
  version "0.11.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/gt2gh/releases/download/v0.11.1/gt2gh-darwin-arm64.tar.gz"
      sha256 "40ae438eee1b77198ccadefe0198456df7f3649efbeb536015e4b71f1d771380"
    end
    on_intel do
      url "https://github.com/shhac/gt2gh/releases/download/v0.11.1/gt2gh-darwin-amd64.tar.gz"
      sha256 "c7d32825059d39b98d35fb8f5a2261a8ba7684337ab4f4cef667bbe47f6179dc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/gt2gh/releases/download/v0.11.1/gt2gh-linux-arm64.tar.gz"
      sha256 "dac891889ac6dc655965917cc18a64c3668fe4408504ec2600e09ea21908ba50"
    end
    on_intel do
      url "https://github.com/shhac/gt2gh/releases/download/v0.11.1/gt2gh-linux-amd64.tar.gz"
      sha256 "fc6a56faba82bb7a2b76b140c78fc7ab0387f9ce0f9475e242638b8d8317cdae"
    end
  end

  def install
    bin.install "gt2gh" => "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.11.1", shell_output("#{bin}/g2g --version")
    assert_match "Link a stack to GitHub", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
