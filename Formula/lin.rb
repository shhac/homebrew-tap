class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.29.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.29.1/lin-darwin-arm64.tar.gz"
      sha256 "71df74ba1946364dff743e421d6ddf8f8af7fe897011bbc361aac86eacc0b83c"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.29.1/lin-darwin-amd64.tar.gz"
      sha256 "05d947e83ded012d470950c8b5ef8ddd9eb96b7500fded1d42cbd7b88267ede8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.29.1/lin-linux-arm64.tar.gz"
      sha256 "3eda2d3a910b024062ab0290f7a13697f42fce8f67e8b5610dcbad8599c5f082"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.29.1/lin-linux-amd64.tar.gz"
      sha256 "c647b875a1e286332fe11dd342fd41e46ca9eb8a780b381b7a3fcb4150d09b5d"
    end
  end

  def install
    bin.install "lin"
    # Installs shell completions via `lin completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"lin", "completion")
  end

  test do
    assert_match "0.29.1", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI for humans and LLMs", shell_output("#{bin}/lin --help")
    assert_match "#compdef lin", shell_output("#{bin}/lin completion zsh")
  end
end
