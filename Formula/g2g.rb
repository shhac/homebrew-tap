class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.31.0/g2g-darwin-arm64.tar.gz"
      sha256 "044b0b9ed79807fdc9a8ad9a94a0221858baf95e14905986d4a3d07196ea6ba5"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.31.0/g2g-darwin-amd64.tar.gz"
      sha256 "43f2a94b33f536ae0cc16db8f448c9ba0023f75c5e5d6e4121370cdf0faa8f7b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.31.0/g2g-linux-arm64.tar.gz"
      sha256 "9cfd02db75b206144f076b4e6e5fd24497b7e1464b14099bb76d2faacd949925"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.31.0/g2g-linux-amd64.tar.gz"
      sha256 "790c74f5be9e23280452e0cfbe9b2ba26e9d21d51c9fd1f899e376c1329511b0"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.31.0", shell_output("#{bin}/g2g --version")
    assert_match "Link a stack to GitHub", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
