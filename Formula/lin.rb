class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.22.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.22.0/lin-darwin-arm64.tar.gz"
      sha256 "c4019eed0f45243d118299d6d88d539b0b1e5c2809a9450ce0f17356d36af410"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.22.0/lin-darwin-amd64.tar.gz"
      sha256 "481ef4fd56e7751f853d601013c555476237f47b3371a1de42c7373f81c14ce6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.22.0/lin-linux-arm64.tar.gz"
      sha256 "74368cf098392e7373a92f9f23781f797034776c46ee4488f6f00e8b4f54d2c2"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.22.0/lin-linux-amd64.tar.gz"
      sha256 "aad9918f2bfb558a627268888fed0d52cb58c9f6b57225c8cbe0fc15552d022a"
    end
  end

  def install
    bin.install Dir["lin*"].first => "lin"
    # Installs shell completions via `lin completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"lin", "completion")
  end

  test do
    assert_match "0.22.0", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI", shell_output("#{bin}/lin --help")
  end
end
