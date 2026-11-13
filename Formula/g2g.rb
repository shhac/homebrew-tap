class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.57.0/g2g-darwin-arm64.tar.gz"
      sha256 "1f765bd586d2bb61bf356f65b3b3b728c5c7177784580eeb06e531c8236d97b1"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.57.0/g2g-darwin-amd64.tar.gz"
      sha256 "b05042404f8083b0faf6ac142806790b2be1373b608cc26c766fe9f7a9e2e56d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.57.0/g2g-linux-arm64.tar.gz"
      sha256 "31932272398f892b13f4a565a98ed9b77df4279f46eff8a0a27d6bc850f4c8e7"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.57.0/g2g-linux-amd64.tar.gz"
      sha256 "4511c7d4495ab0ff256f590f5711b058c0f534a9f4495722b08794243cdacf8e"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.57.0", shell_output("#{bin}/g2g --version")
    assert_match "Manage stacked branches", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
