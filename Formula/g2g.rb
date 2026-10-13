class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.50.0/g2g-darwin-arm64.tar.gz"
      sha256 "430cd8e6d419d020da7d47e22cc083be65cccab421a22fcf713045be843a4dd0"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.50.0/g2g-darwin-amd64.tar.gz"
      sha256 "b25fe531a1d790662b5b56e88ddfebf639f2cef13b5492beb8a367164677ce6d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.50.0/g2g-linux-arm64.tar.gz"
      sha256 "f9f7a2c0bca5de1ae111f52746e994043de0ed865be3fd3bd44cd3daf93a1f69"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.50.0/g2g-linux-amd64.tar.gz"
      sha256 "f0c8953184da1a7b72d7e3037942526698fe897fde7225313988f444d2081212"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.50.0", shell_output("#{bin}/g2g --version")
    assert_match "Manage stacked branches", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
