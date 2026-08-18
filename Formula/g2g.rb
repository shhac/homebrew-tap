class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  version "0.16.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.16.0/g2g-darwin-arm64.tar.gz"
      sha256 "86d24a720a1bd7a02bec4fc317fe0e78cf803677daadc007f18502f3c37749cb"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.16.0/g2g-darwin-amd64.tar.gz"
      sha256 "4c1c195bca7cb241c3313b68d20e5f5ec444df6a4ae0f43230be073be22f920a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.16.0/g2g-linux-arm64.tar.gz"
      sha256 "92c89513a2c077966d667b9e5112f6c77c9b75fede5e1680be44a3c787d68d91"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.16.0/g2g-linux-amd64.tar.gz"
      sha256 "0d37e66fc3f2347af0c0405435031c7b2739a523a3751ba101e5f8aae2f7e6c6"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.16.0", shell_output("#{bin}/g2g --version")
    assert_match "Link a stack to GitHub", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
