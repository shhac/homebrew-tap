class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.35.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.35.1/lin-darwin-arm64.tar.gz"
      sha256 "10c4f7ae2cf0fdd7a1a85ed1d95835cd40bd48a87e430c745d40b26d93cf4da1"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.35.1/lin-darwin-amd64.tar.gz"
      sha256 "5b0250aaf964dd7adbb1f96941bf8f4c4642f41942fd14281f7fd7eab71dca4e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.35.1/lin-linux-arm64.tar.gz"
      sha256 "57d171076622f4d8dd4c1ea6ed51fca11eb75ac642f15f6ce7d58f24709e7405"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.35.1/lin-linux-amd64.tar.gz"
      sha256 "6284e88b7869ebbc725b376b1ab4476b0167dfcd0e4c43cf5e5014bb17a31a60"
    end
  end

  def install
    bin.install "lin"
    # Installs shell completions via `lin completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"lin", "completion")
  end

  test do
    assert_match "0.35.1", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI for humans and LLMs", shell_output("#{bin}/lin --help")
    assert_match "#compdef lin", shell_output("#{bin}/lin completion zsh")
  end
end
