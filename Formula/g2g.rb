class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  version "0.14.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.14.0/g2g-darwin-arm64.tar.gz"
      sha256 "179bf5420808bfb9aee7ea578c80510578db128b8a225aa2382e6de428904bf4"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.14.0/g2g-darwin-amd64.tar.gz"
      sha256 "d7a3c939e16db3084d3ab8e19e443d9d0ce29ea2c6454c6c37d455197600da73"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.14.0/g2g-linux-arm64.tar.gz"
      sha256 "1a6e6ae3cff9f1c3212a2010ebd33425a13f59bd65243232760073cb23ab0e12"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.14.0/g2g-linux-amd64.tar.gz"
      sha256 "1140980f01879970a19caf86279fe9c6f68a2c06f9c18e204c1548d76969ccb9"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.14.0", shell_output("#{bin}/g2g --version")
    assert_match "Link a stack to GitHub", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
