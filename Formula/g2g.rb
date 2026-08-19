class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  version "0.20.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.20.0/g2g-darwin-arm64.tar.gz"
      sha256 "92905beb8d6a80e3b91eea2731829df052710e2d0ea1664705ded3c1e9b955ca"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.20.0/g2g-darwin-amd64.tar.gz"
      sha256 "304da88ebaa954c7f9bb32a4a76dbea1bff55861bc5b4052dbead5b95890e0a7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.20.0/g2g-linux-arm64.tar.gz"
      sha256 "b3996defa6ed1dbfc8f022343cabef2db32215df13e315217aef5ef9fce96af5"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.20.0/g2g-linux-amd64.tar.gz"
      sha256 "8fe0bc18cf0adb670e41302e33a371667cc3bd5b6e865826796b2af33a8586c6"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.20.0", shell_output("#{bin}/g2g --version")
    assert_match "Link a stack to GitHub", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
