class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.29.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.29.0/lin-darwin-arm64.tar.gz"
      sha256 "77e2204c7edbd0c221f5bb062073db6141ff936387d978e2f92652e3a38e3ab3"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.29.0/lin-darwin-amd64.tar.gz"
      sha256 "d7fe015bc559fcfb2fb0de9363576073baf9933e07bedf98f1ca07e25a911f0a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.29.0/lin-linux-arm64.tar.gz"
      sha256 "e6d8fdf935e693410b863b0cf02f22dc5de81c2bcf520915f9bd16964ff7c0f2"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.29.0/lin-linux-amd64.tar.gz"
      sha256 "d4abad9db39282e62a9bc44a4c41738e5e43df7969ad8474d0ca92c45a7afac0"
    end
  end

  def install
    bin.install "lin"
    # Installs shell completions via `lin completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"lin", "completion")
  end

  test do
    assert_match "0.29.0", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI for humans and LLMs", shell_output("#{bin}/lin --help")
    assert_match "#compdef lin", shell_output("#{bin}/lin completion zsh")
  end
end
