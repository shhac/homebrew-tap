class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.33.1/g2g-darwin-arm64.tar.gz"
      sha256 "758936252f03a7452879399a0a7ad8cbeb0ba949a15726083573e9014c400b52"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.33.1/g2g-darwin-amd64.tar.gz"
      sha256 "fd5b1bf52217292bb3eac22e211198277ca3e00038863ffafa4622bd1e810942"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.33.1/g2g-linux-arm64.tar.gz"
      sha256 "7f4d92dc36a58ea5d5e829702f5a774e4fb47e86a1dc1f741ad1cd96d9867d3f"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.33.1/g2g-linux-amd64.tar.gz"
      sha256 "237849e82354545c34673ab769b3bef0ccc950f72c664d0a3781fe2c40f73871"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.33.1", shell_output("#{bin}/g2g --version")
    assert_match "Link a stack to GitHub", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
