class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.44.0/g2g-darwin-arm64.tar.gz"
      sha256 "d7203c3f106a3af2e23683e98f2612808411b976868ab53400f4b017677867be"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.44.0/g2g-darwin-amd64.tar.gz"
      sha256 "abb28cca4298d584d05ad5f64b94f335b40980e393fff23fa7d9ca7613f2c85e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.44.0/g2g-linux-arm64.tar.gz"
      sha256 "ae06995ea53efb1cdc515cb6138ecb944fe2587d02daabae10f30149ee4aff41"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.44.0/g2g-linux-amd64.tar.gz"
      sha256 "54e97a3844aeed7784d30b0fd9daf8f92d9e83c5b543501ecdb4036d6079e420"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.44.0", shell_output("#{bin}/g2g --version")
    assert_match "Manage stacked branches", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
