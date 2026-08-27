class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  version "0.28.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.28.0/g2g-darwin-arm64.tar.gz"
      sha256 "7ceca6da5dd9e35426ebb555e6a33ffd7c0225e49578837ccd762b3731dfd250"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.28.0/g2g-darwin-amd64.tar.gz"
      sha256 "2274efdd5e016dcee219088cb7a603f2c781d6c4503004f436ddbc23dcf6ab11"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.28.0/g2g-linux-arm64.tar.gz"
      sha256 "dd4ce8b74db0703a811e4447c2199cf6a9bb908ae922af4c866a7736c052d051"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.28.0/g2g-linux-amd64.tar.gz"
      sha256 "a299b3f3ee93ec13496ef9e6d865a53aece86da2fb20cbd5911530f98d896df9"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.28.0", shell_output("#{bin}/g2g --version")
    assert_match "Link a stack to GitHub", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
