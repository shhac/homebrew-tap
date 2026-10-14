class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.51.0/g2g-darwin-arm64.tar.gz"
      sha256 "f7522c54307090b6c7b3458776e1c35eb0a276207d7647eb2ea86bb5cef38059"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.51.0/g2g-darwin-amd64.tar.gz"
      sha256 "e7bcef930a0471fc91291da0dbd842b3667a286429d17939d005818f7ec29f9d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.51.0/g2g-linux-arm64.tar.gz"
      sha256 "84a89e55a1bc2cb60283a3bf0bd0be0c7061ccda55d0ecc153be7dd27da54541"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.51.0/g2g-linux-amd64.tar.gz"
      sha256 "ef1a231631387ef07de6bd8618ea4e76ca6e94a01aaacf98669e27d30e4bdfd8"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.51.0", shell_output("#{bin}/g2g --version")
    assert_match "Manage stacked branches", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
