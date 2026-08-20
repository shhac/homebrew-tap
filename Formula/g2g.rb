class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  version "0.23.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.23.0/g2g-darwin-arm64.tar.gz"
      sha256 "6d11a7f2b8696b2c115628d9ed18d54bceef7df18a822519fba761c70428a07e"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.23.0/g2g-darwin-amd64.tar.gz"
      sha256 "c72ae37e91cb55f2b7b87d91e23bd2e4a6dcddf63db545f43e70485eba55796d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.23.0/g2g-linux-arm64.tar.gz"
      sha256 "e795cb9ac54cbc3e0927f6025f07968a4cf0bd57b4b81044bf4ea20b2f79063c"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.23.0/g2g-linux-amd64.tar.gz"
      sha256 "58066c8cb8bb9986b31f2917884cbcb2d380873df491e5e296cfb7ff72db8227"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.23.0", shell_output("#{bin}/g2g --version")
    assert_match "Link a stack to GitHub", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
