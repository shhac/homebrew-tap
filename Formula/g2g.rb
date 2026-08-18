class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  version "0.15.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.15.1/g2g-darwin-arm64.tar.gz"
      sha256 "8fc296b2869d8f8c617b819259591ef27640d5b1637198e9d6dd91cd4b8d6639"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.15.1/g2g-darwin-amd64.tar.gz"
      sha256 "61c39ce74248418e3979fadea6dfb29c3da524d57c7e117316139d1a3a75ae4e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.15.1/g2g-linux-arm64.tar.gz"
      sha256 "2edc59fb7f9a6d1fecdd95f6754e08bdbb6277183f0123811f6f5c76a2520dc6"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.15.1/g2g-linux-amd64.tar.gz"
      sha256 "259dac4a497ef1b8e143f99cd6dbf7234483d5961397310d4f63a7a5eb546d6c"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.15.1", shell_output("#{bin}/g2g --version")
    assert_match "Link a stack to GitHub", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
