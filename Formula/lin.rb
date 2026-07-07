class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.36.1"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.36.1/lin-darwin-arm64.tar.gz"
      sha256 "cfbaffec1ca86948a421a719c19f8dc2f98716a8ef2fadc8edaba68fac38f218"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.36.1/lin-darwin-amd64.tar.gz"
      sha256 "131cdcfc5dfe61b3980c265e7b9094a509a7304d45199032f82691723e84dee8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.36.1/lin-linux-arm64.tar.gz"
      sha256 "c815dd7a7e92bc9ee6468ce3b651f65790a312c6baadd7fd930e881006c7a249"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.36.1/lin-linux-amd64.tar.gz"
      sha256 "f264245bbbf03e89558fa39f782154874c1e4d57b7a78c3d9c2ebe6e36c08930"
    end
  end

  def install
    bin.install "lin"
    # Installs shell completions via `lin completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"lin", "completion")
  end

  test do
    assert_match "0.36.1", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI for humans and LLMs", shell_output("#{bin}/lin --help")
    assert_match "#compdef lin", shell_output("#{bin}/lin completion zsh")
  end
end
