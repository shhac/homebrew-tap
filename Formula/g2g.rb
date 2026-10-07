class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.45.0/g2g-darwin-arm64.tar.gz"
      sha256 "cd328c554f2dd7a186df9469317e8f0e82f274cdf53deea16bca5cec446cdadb"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.45.0/g2g-darwin-amd64.tar.gz"
      sha256 "7f4054e1f117c204bd7a1a7b36cbcef526d0746eaf66d873597c6c0efaa2c80d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.45.0/g2g-linux-arm64.tar.gz"
      sha256 "96a983a4ff9535799e84e39185bc9e67459431b6bfcd037bcc902dae98d6e44b"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.45.0/g2g-linux-amd64.tar.gz"
      sha256 "598494537ed9252bb3c94d009277357ac20f992087de95aa2623dd6e6bf8cbf8"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.45.0", shell_output("#{bin}/g2g --version")
    assert_match "Manage stacked branches", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
