class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.54.0/g2g-darwin-arm64.tar.gz"
      sha256 "166ec0cc07d7b83017eccd3163ab169f37b8636d8baf935d7c5923c002063ff3"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.54.0/g2g-darwin-amd64.tar.gz"
      sha256 "b4d563c37760455ee43b1fb252a3bb7bf497f8755df2b4af89bef76481ec16cc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.54.0/g2g-linux-arm64.tar.gz"
      sha256 "faac56596a29fce558f626743f8194d96f2838f17a4b39ad2ae6239813713564"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.54.0/g2g-linux-amd64.tar.gz"
      sha256 "3f3b1e4cd1ce688f720946a285be074a51e94a719f3d9a4c92ce1a63ab331738"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.54.0", shell_output("#{bin}/g2g --version")
    assert_match "Manage stacked branches", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
