class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.46.0/g2g-darwin-arm64.tar.gz"
      sha256 "2a924f5d1bb3ec6dc0ed5ca8127cd368e6b62691b84978a9ad601ae3701ee394"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.46.0/g2g-darwin-amd64.tar.gz"
      sha256 "365a34ed4ea403dd4cadd0f9b04f8e89e7662b9ad93b5129e4f91d040fe57ace"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.46.0/g2g-linux-arm64.tar.gz"
      sha256 "c4f8ebdc5b4818e818be6da04dd3d9dfc9f461dfc57f56416a31d933221a21b8"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.46.0/g2g-linux-amd64.tar.gz"
      sha256 "286365f60cc7a74b0ba3d1c926b41ea44ef34c6dc8ff0f1bdc6cf4a7a2533ff3"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.46.0", shell_output("#{bin}/g2g --version")
    assert_match "Manage stacked branches", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
