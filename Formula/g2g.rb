class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.55.0/g2g-darwin-arm64.tar.gz"
      sha256 "01a4efea88230f3d1197d36e1ce5a069d0314a206d6962dd1991cf97675e2fd2"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.55.0/g2g-darwin-amd64.tar.gz"
      sha256 "a3cc8ffbd88e7e15d7e3b6f5d1a2a459927edf660dd44e70d308eb91acb5fc04"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.55.0/g2g-linux-arm64.tar.gz"
      sha256 "300ca04e77452f97d1d738e573e6fa6213ca6489a0865895b6af9bab844d18ef"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.55.0/g2g-linux-amd64.tar.gz"
      sha256 "655d1ad627a379521f4fa8c4cbb22f3daf04bd724807eddb09d049adaf09a4d5"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.55.0", shell_output("#{bin}/g2g --version")
    assert_match "Manage stacked branches", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
