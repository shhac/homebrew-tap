class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.60.0/g2g-darwin-arm64.tar.gz"
      sha256 "5d8e9e5d362d85a042682ccf42eea3e72d20e49482d18c3b7dac921f58d5969c"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.60.0/g2g-darwin-amd64.tar.gz"
      sha256 "6aa3381955140173e5c711d67c17b2ac9a0395dc7d5faff578e491839cb7b1b2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.60.0/g2g-linux-arm64.tar.gz"
      sha256 "7f5113bd8197a99fc1dfce229d06c4af705faee18fb0413f30e8f0bd993acec9"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.60.0/g2g-linux-amd64.tar.gz"
      sha256 "4910f8f59125e97fcc60f80eb6f0cdd2d973b4c76a477d4d9c2f201cfdd49e88"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.60.0", shell_output("#{bin}/g2g --version")
    assert_match "Manage stacked branches", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
