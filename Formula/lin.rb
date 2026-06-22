class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.24.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.24.0/lin-darwin-arm64.tar.gz"
      sha256 "f0526a1b8942477e5bbe7e1f4160d5d1a74abc9be81754809288f64cc2d3d71a"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.24.0/lin-darwin-amd64.tar.gz"
      sha256 "8ee385239af2e6a09316a18f0bcb2bedba7a0032e1500a3942c556257b61877c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.24.0/lin-linux-arm64.tar.gz"
      sha256 "26712e4187fc49ab774e1282585299afe62e6d627c25bd2cb8546fffb6a4f803"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.24.0/lin-linux-amd64.tar.gz"
      sha256 "947713dab3ecbe9d393db22b808d1a44f74c53eeb7024e651123206885c3868a"
    end
  end

  def install
    bin.install "lin"
    # Installs shell completions via `lin completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"lin", "completion")
  end

  test do
    assert_match "0.24.0", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI for humans and LLMs", shell_output("#{bin}/lin --help")
    assert_match "#compdef lin", shell_output("#{bin}/lin completion zsh")
  end
end
