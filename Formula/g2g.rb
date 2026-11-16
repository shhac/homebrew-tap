class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.58.0/g2g-darwin-arm64.tar.gz"
      sha256 "afcb6937d900b631d36c92b11dab10cb85d3d9e50bf82c6dcee3e207d516608c"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.58.0/g2g-darwin-amd64.tar.gz"
      sha256 "86f9a2001f6ffc83f81c85fbd987955e5572af093c0ff53b3372e0ccba695305"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.58.0/g2g-linux-arm64.tar.gz"
      sha256 "16af31a1ad4f7ac0d6000fc9eb196ac3e5f4413f0051e23d902483d7f4cb5a70"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.58.0/g2g-linux-amd64.tar.gz"
      sha256 "c6c4e72d1f6d3b701e9fa0e6d9feebe122837eda668c78e25319f62aed13c6d3"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.58.0", shell_output("#{bin}/g2g --version")
    assert_match "Manage stacked branches", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
