class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.35.1/g2g-darwin-arm64.tar.gz"
      sha256 "46aba3a685ea57b9607bf9ca5f1bc4d698ec2b65a2f3ba63762753c3a74bf34e"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.35.1/g2g-darwin-amd64.tar.gz"
      sha256 "67c122c49ed6fee60ebf9eadd9e66e1133a8c9704034146b4994953e6303f190"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.35.1/g2g-linux-arm64.tar.gz"
      sha256 "17abeb5f7d51a8d22bf2f16aef9ee7368be94199b1d60cf7e2caf4bc3d8a377a"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.35.1/g2g-linux-amd64.tar.gz"
      sha256 "a3d312372e7fda38ac66d552111ee235e3c5bb4c1647fbc37cfd53c63c099a79"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.35.1", shell_output("#{bin}/g2g --version")
    assert_match "Manage stacked branches", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
