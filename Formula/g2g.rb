class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  version "0.21.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.21.1/g2g-darwin-arm64.tar.gz"
      sha256 "7a2f902343ad3b9204f912b4f92727983085900438bcb4c3bc300c0e3c9fd8fd"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.21.1/g2g-darwin-amd64.tar.gz"
      sha256 "335a6328ba0cdc40fdb94a0000d24abc57ae91c947c2f5a4d13e6360302f36a5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.21.1/g2g-linux-arm64.tar.gz"
      sha256 "b97f4fde23058ab1945aa9264789448df29f7cbd320dd84dcfa4f9bd49e707b0"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.21.1/g2g-linux-amd64.tar.gz"
      sha256 "42b76a8ead30e79b136e1389bd4bbbfe7346283f14862f451e10f271cf50bb5a"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.21.1", shell_output("#{bin}/g2g --version")
    assert_match "Link a stack to GitHub", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
