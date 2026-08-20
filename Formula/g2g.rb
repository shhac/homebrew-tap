class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  version "0.25.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.25.0/g2g-darwin-arm64.tar.gz"
      sha256 "7e66b5fbea30c6594f935e46fd3e9614f0e3470ca8c514683fd3050164275f81"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.25.0/g2g-darwin-amd64.tar.gz"
      sha256 "489b59494aada695c658b0a31605bd35234ade3bf0fca2960443a8673dc46c58"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.25.0/g2g-linux-arm64.tar.gz"
      sha256 "e21f385673a7d9eab41f2fc487c4c9bfcb179429b579195ab597830cceda2bc0"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.25.0/g2g-linux-amd64.tar.gz"
      sha256 "5d6c7e211e9f7659acf81d3ccae429d0a2708e130ae17a128459334c3020a27d"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.25.0", shell_output("#{bin}/g2g --version")
    assert_match "Link a stack to GitHub", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
