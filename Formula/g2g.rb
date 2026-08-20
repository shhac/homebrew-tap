class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  version "0.21.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.21.2/g2g-darwin-arm64.tar.gz"
      sha256 "4e64c869880f163b0ec0ceb4691767e16ae627954c142adeb31ce01362bf26bf"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.21.2/g2g-darwin-amd64.tar.gz"
      sha256 "ecd76263cf3d706945af951b1d647a95593ce12705d864d94ea80f7cf7be9edd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.21.2/g2g-linux-arm64.tar.gz"
      sha256 "f7f48188820484e86844402b34256cc0fc9a070c8511d87cb04b6044e2a12de8"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.21.2/g2g-linux-amd64.tar.gz"
      sha256 "56ecd4c5e6a918f2c49d080bae5e394af09c694687e427b6fc86310513a99012"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.21.2", shell_output("#{bin}/g2g --version")
    assert_match "Link a stack to GitHub", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
