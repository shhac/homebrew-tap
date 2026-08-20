class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  version "0.27.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.27.0/g2g-darwin-arm64.tar.gz"
      sha256 "d560342155bb71fcea56225e23203d66340acebd89e266d1a7880481fbbb08ca"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.27.0/g2g-darwin-amd64.tar.gz"
      sha256 "81071c82ffd3eef5d55022fcfbf473882b78d9784ec6c49afcf412490d100f1d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.27.0/g2g-linux-arm64.tar.gz"
      sha256 "ac6af194fc7687f2da63ed5ec360a1d57e367b51518abd9a3e3ffe683d172d2c"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.27.0/g2g-linux-amd64.tar.gz"
      sha256 "5bfde08a86ba524ec648be66985da6b0105124fdb27d90a16b13764c0b3bb247"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.27.0", shell_output("#{bin}/g2g --version")
    assert_match "Link a stack to GitHub", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
