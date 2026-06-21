class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.23.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.23.0/lin-darwin-arm64.tar.gz"
      sha256 "da7fee1435c3486a7a40c88f1a60a76ff5ca1a74ba8cf47087471426775a3da0"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.23.0/lin-darwin-amd64.tar.gz"
      sha256 "aadf314e6631967b552af5f34328640ea86be44e4402388fd844b9d9be46957d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.23.0/lin-linux-arm64.tar.gz"
      sha256 "a3f3aaad75cbe08c93aeecd5f21c5b447be6ee224c2ac68f15a5a06773489a2c"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.23.0/lin-linux-amd64.tar.gz"
      sha256 "2c18640cec52519252382fddf014615a50d292e321f0fc51ab6fff7b2b4eb937"
    end
  end

  def install
    bin.install "lin"
    # Installs shell completions via `lin completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"lin", "completion")
  end

  test do
    assert_match "0.23.0", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI for humans and LLMs", shell_output("#{bin}/lin --help")
    assert_match "#compdef lin", shell_output("#{bin}/lin completion zsh")
  end
end
