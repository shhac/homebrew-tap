class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.32.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.32.0/lin-darwin-arm64.tar.gz"
      sha256 "45ea3d99cdb267fd8fabb0aac086dc1750421ae7d97da3f936c0c1974744c631"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.32.0/lin-darwin-amd64.tar.gz"
      sha256 "c6f49114c0594c7081ff5578a2ddd209ac8ee1ad927d0a396cc5d505bd897853"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.32.0/lin-linux-arm64.tar.gz"
      sha256 "cc7a5cda8eca9cd6c9cc21d053cf4d2dcadbf082e9b1412a252c8dafe6909059"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.32.0/lin-linux-amd64.tar.gz"
      sha256 "8fcb110f4f5136c68dca1edc7ee0930baaca92696cc9a826660c79aa660ea271"
    end
  end

  def install
    bin.install "lin"
    # Installs shell completions via `lin completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"lin", "completion")
  end

  test do
    assert_match "0.32.0", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI for humans and LLMs", shell_output("#{bin}/lin --help")
    assert_match "#compdef lin", shell_output("#{bin}/lin completion zsh")
  end
end
