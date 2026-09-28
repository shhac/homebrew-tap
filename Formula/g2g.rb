class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.38.0/g2g-darwin-arm64.tar.gz"
      sha256 "2afdbc1fa6f6b88c364a64a860e6607467e3ed9f9e6ef4f0a7ab7d5881f5d96b"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.38.0/g2g-darwin-amd64.tar.gz"
      sha256 "e82e74b4a00fc2ad94edf66db0f20d1a6a67a7e70c0c6805ea521e71e05a46fe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.38.0/g2g-linux-arm64.tar.gz"
      sha256 "d82def476077c21d29d14e08c16849aceff255606c7397da4914c7490ff1c6a1"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.38.0/g2g-linux-amd64.tar.gz"
      sha256 "308cb5893cb049bb530d436c208509912e2f1b4f6a9e8f30a216c41a0c447aad"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.38.0", shell_output("#{bin}/g2g --version")
    assert_match "Manage stacked branches", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
