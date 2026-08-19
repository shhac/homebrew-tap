class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  version "0.21.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.21.0/g2g-darwin-arm64.tar.gz"
      sha256 "7f620d868c707014c5e6a127a53236690e4227d2e1417aeac0c8853130b989e9"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.21.0/g2g-darwin-amd64.tar.gz"
      sha256 "38dac89254424ef234d96814cd3183c65cce6f084cf7119dbfc7b73aac24d8ae"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.21.0/g2g-linux-arm64.tar.gz"
      sha256 "189adf23ecb326701e0f4abfdf17c170563543c2978b17988a3c5f8cb15b5da4"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.21.0/g2g-linux-amd64.tar.gz"
      sha256 "e879682ac77fe1b59a3a0aae16c39c1e8b37fbf42aa9965f5d8ca62742e4aba6"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.21.0", shell_output("#{bin}/g2g --version")
    assert_match "Link a stack to GitHub", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
