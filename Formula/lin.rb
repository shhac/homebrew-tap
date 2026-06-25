class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.30.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.30.0/lin-darwin-arm64.tar.gz"
      sha256 "67a34b0fb76029a564a43f7de27fd8097f742187d61125a5d1a3ba8619b296f6"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.30.0/lin-darwin-amd64.tar.gz"
      sha256 "adffb336fce5bbd992cb652043f96f6930df2a4c01ceb14bd95efcd55e36ad66"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.30.0/lin-linux-arm64.tar.gz"
      sha256 "1f018f7503571c27507255add3d7a098ebf62844649f6d8ebea8d2dccc26d634"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.30.0/lin-linux-amd64.tar.gz"
      sha256 "a15c47ff1737ecc2f1aa88d7cab06ccde0b006ad3a5eb162cbeaf17839e381b9"
    end
  end

  def install
    bin.install "lin"
    # Installs shell completions via `lin completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"lin", "completion")
  end

  test do
    assert_match "0.30.0", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI for humans and LLMs", shell_output("#{bin}/lin --help")
    assert_match "#compdef lin", shell_output("#{bin}/lin completion zsh")
  end
end
