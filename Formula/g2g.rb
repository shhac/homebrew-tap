class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.61.1/g2g-darwin-arm64.tar.gz"
      sha256 "f9738a21bd29f15e0e02098830324b721227bf34712181662ea5c24a04d74ea8"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.61.1/g2g-darwin-amd64.tar.gz"
      sha256 "69d57142eef48ee40086fef4112392aa9b81d527e17c0313751def413a70e00f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.61.1/g2g-linux-arm64.tar.gz"
      sha256 "2036b71eefd40e9d9f6f1f96da613ff95ea4fae13b271da34b09a8816503e0a2"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.61.1/g2g-linux-amd64.tar.gz"
      sha256 "46ba7a169a0153ca4428a522c3dc3102930407e49a95f3a4f7c32ca699628f49"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.61.1", shell_output("#{bin}/g2g --version")
    assert_match "Manage stacked branches", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
