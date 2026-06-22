class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.25.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.25.0/lin-darwin-arm64.tar.gz"
      sha256 "767b5f1a4acebd1bb7e618109288e00e5b9958d93fdf79b6226d00e954539827"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.25.0/lin-darwin-amd64.tar.gz"
      sha256 "2e69de54b8c16fe801e6693f3a5cc2c81f059851cf4bbee9bbbf2c212cd71a09"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.25.0/lin-linux-arm64.tar.gz"
      sha256 "ab80b4087358bf6c5afd8845cb11626f284a4dfab965bc10b74830ec8955ba56"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.25.0/lin-linux-amd64.tar.gz"
      sha256 "39afb1516d98710c1d2cf60d5106d2f1871ffacdaca5774ad1ebd4d6f5609866"
    end
  end

  def install
    bin.install "lin"
    # Installs shell completions via `lin completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"lin", "completion")
  end

  test do
    assert_match "0.25.0", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI for humans and LLMs", shell_output("#{bin}/lin --help")
    assert_match "#compdef lin", shell_output("#{bin}/lin completion zsh")
  end
end
