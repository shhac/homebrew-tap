class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.61.2/g2g-darwin-arm64.tar.gz"
      sha256 "7effec50cecfbdddf8219929c2d1bbdce8bcd401feeade5c1ea6df0b830329ce"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.61.2/g2g-darwin-amd64.tar.gz"
      sha256 "eb1ee2cc36b4405afe08175f914c110204ffe7f63fe9722696ef1016df68aee0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.61.2/g2g-linux-arm64.tar.gz"
      sha256 "6f05afd62f6b52cc506267feabf6afa585a8c567f8a1ee0edfff893a40cdd0f5"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.61.2/g2g-linux-amd64.tar.gz"
      sha256 "abd4566eeed5931d8fcefeea1c827f9041f9fdd5dc2699800d1e4e7757b44ee9"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.61.2", shell_output("#{bin}/g2g --version")
    assert_match "Manage stacked branches", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
