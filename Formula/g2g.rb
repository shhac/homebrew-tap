class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.34.0/g2g-darwin-arm64.tar.gz"
      sha256 "95194787ae30b770eff323636f143ae463022589f35302033d4f45658f14418e"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.34.0/g2g-darwin-amd64.tar.gz"
      sha256 "3121167e3bd7f4ad116a448327bc8251f876cd4df8337e9a9c5db003f4d98ee8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.34.0/g2g-linux-arm64.tar.gz"
      sha256 "910413b9e49004940001155018a7478e025c2fe17edd269ea7ccb40f4512de43"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.34.0/g2g-linux-amd64.tar.gz"
      sha256 "0c5f4d421a4ba1e946305f8ea11d453d62a885febd7daa871f4a1c8625208e59"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.34.0", shell_output("#{bin}/g2g --version")
    assert_match "Manage stacked branches", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
