class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.35.0/g2g-darwin-arm64.tar.gz"
      sha256 "7f94c78d2667c1ba58464153b576dd7252e0ef5ea3f11301833ae16f63bb66af"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.35.0/g2g-darwin-amd64.tar.gz"
      sha256 "4190735fc471f0c1ace9ae29fd7de69a37037f81a6075f6efb59eb20a8e1bb78"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.35.0/g2g-linux-arm64.tar.gz"
      sha256 "7455bbd9fd3436670edcc29ad8e6b4d0a0fe4f1404971b5ad06573a362a1f53f"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.35.0/g2g-linux-amd64.tar.gz"
      sha256 "fa22d277635643111f4aedec7f405e64912d61d991e8b56cca7e5c0593e90e15"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.35.0", shell_output("#{bin}/g2g --version")
    assert_match "Manage stacked branches", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
