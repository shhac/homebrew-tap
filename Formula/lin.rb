class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.22.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.22.1/lin-darwin-arm64.tar.gz"
      sha256 "3bee13dad8adb5ce881c7c8208d38ace19933d2e9eeee0205bab351ecaa0eabf"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.22.1/lin-darwin-amd64.tar.gz"
      sha256 "ac4d34408aa93b07f0735e997d326dcd7c997ae8b55bd24bc524787d6cbe098c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.22.1/lin-linux-arm64.tar.gz"
      sha256 "4147b1b9b9c777b42f81021f05965fa76762683814c552a68b31fa576607692a"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.22.1/lin-linux-amd64.tar.gz"
      sha256 "67d1cbef2c75fbae2290415fb398efd6a3c967c63f3139f763ff43b3bbaa1bd6"
    end
  end

  def install
    bin.install "lin"
    # Installs shell completions via `lin completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"lin", "completion")
  end

  test do
    assert_match "0.22.1", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI for humans and LLMs", shell_output("#{bin}/lin --help")
    assert_match "#compdef lin", shell_output("#{bin}/lin completion zsh")
  end
end
