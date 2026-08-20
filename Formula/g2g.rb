class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  version "0.22.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.22.0/g2g-darwin-arm64.tar.gz"
      sha256 "0a2fa91caadf8872ddeb8e9b49f8891b46a9fdaaa99eceea712cb8432469bddf"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.22.0/g2g-darwin-amd64.tar.gz"
      sha256 "d8bffdf47e3020e88d1afdd65933ab16842ad8d82cb9af3e881542d5a70c1db6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.22.0/g2g-linux-arm64.tar.gz"
      sha256 "0420fc06150a5ab71d6648a504a9308d6c401a9dab6f526c8656683cff721902"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.22.0/g2g-linux-amd64.tar.gz"
      sha256 "f2d84de673a28b9642ad9215583893d8d26796554730e4b8868a32e24ad8fd39"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.22.0", shell_output("#{bin}/g2g --version")
    assert_match "Link a stack to GitHub", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
