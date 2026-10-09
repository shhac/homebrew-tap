class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.47.0/g2g-darwin-arm64.tar.gz"
      sha256 "1cec21f22d44a95e9a1852c8109885af6485a638ee964fc2f689bb02be4cedef"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.47.0/g2g-darwin-amd64.tar.gz"
      sha256 "06c99f71523d2c94998fefdff79e6ec50693b76b223b09e123c0acd13b9be99e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.47.0/g2g-linux-arm64.tar.gz"
      sha256 "b64cdc2104471cfca76bb31fc04c30e159625f0601617959f3abb2f488f915a8"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.47.0/g2g-linux-amd64.tar.gz"
      sha256 "cdfab8cd73931de496d0ec5827dd891352e26de2f98067bcdb1c98f0fd18b5bc"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.47.0", shell_output("#{bin}/g2g --version")
    assert_match "Manage stacked branches", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
