class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.61.0/g2g-darwin-arm64.tar.gz"
      sha256 "a278c6d52b1d0a3cfc82bb064f60f4fa6c6f59074bafab15fddf2f621210078f"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.61.0/g2g-darwin-amd64.tar.gz"
      sha256 "e9aabeacae38da236a03077f3a5d31ca5f7072cfd4e9e610c0ed26130153d7cd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.61.0/g2g-linux-arm64.tar.gz"
      sha256 "a3db7649670185052deaf9af6b6dafd2d79bdf37471e61afec35b3513063f0a2"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.61.0/g2g-linux-amd64.tar.gz"
      sha256 "9a2e866fe16ee2e8b75212ad45bc9a66b167c05f38ccee908cbf0c781097fd39"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.61.0", shell_output("#{bin}/g2g --version")
    assert_match "Manage stacked branches", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
