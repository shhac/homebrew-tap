class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.52.0/g2g-darwin-arm64.tar.gz"
      sha256 "b1a60967c5bd92b1f80cbbcd46292fe8aaf7da2ba0ec809d5093ef1926361600"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.52.0/g2g-darwin-amd64.tar.gz"
      sha256 "eec99b83be6c734de16c3d962dbc193581ea72554220d107c5778570e9ee4dc1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.52.0/g2g-linux-arm64.tar.gz"
      sha256 "8f944c628bf725f066eb4e3fd8be401e2ce606488ef69d11c9d8ca336a1d4a8b"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.52.0/g2g-linux-amd64.tar.gz"
      sha256 "50d080ca14ca3176bb3b2c266e8dc75f1eb2b1229bff1253a0661f36a635bf32"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.52.0", shell_output("#{bin}/g2g --version")
    assert_match "Manage stacked branches", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
