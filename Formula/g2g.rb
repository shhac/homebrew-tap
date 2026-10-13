class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.49.0/g2g-darwin-arm64.tar.gz"
      sha256 "b9129c7701112d58927525fb033005869d73f846b03481a6ef4648792685b100"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.49.0/g2g-darwin-amd64.tar.gz"
      sha256 "a03910aa727aad243ed39e42576170cbc38771de55c7ec14c104ccfb6dc8848e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.49.0/g2g-linux-arm64.tar.gz"
      sha256 "f155dc965c98282e55e5f6a1c983726157a146723b3b061a31d3c03ba7a009cd"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.49.0/g2g-linux-amd64.tar.gz"
      sha256 "96f6a1b0238cb28c080c37648e45d6d8d0261cad36355a288d7348bd1f45607a"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.49.0", shell_output("#{bin}/g2g --version")
    assert_match "Manage stacked branches", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
