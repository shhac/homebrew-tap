class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.36.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.36.0/lin-darwin-arm64.tar.gz"
      sha256 "7207ab624fe1508a08a0dd5bc1f7843679b7b69bb70466ec3d9f3261ddfe6353"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.36.0/lin-darwin-amd64.tar.gz"
      sha256 "0d78a0ee9df73d7e59a99f00f037fd0663c0068e37867155532eae3c4879b0ac"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.36.0/lin-linux-arm64.tar.gz"
      sha256 "cde0a7d40cc07ba535df14b3fef35a43e5778c8bc534f6260843664d94407e40"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.36.0/lin-linux-amd64.tar.gz"
      sha256 "c0c65d6964c3de3e1d474280411417f91e2528789f11ed9f85c79869b775754c"
    end
  end

  def install
    bin.install "lin"
    # Installs shell completions via `lin completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"lin", "completion")
  end

  test do
    assert_match "0.36.0", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI for humans and LLMs", shell_output("#{bin}/lin --help")
    assert_match "#compdef lin", shell_output("#{bin}/lin completion zsh")
  end
end
