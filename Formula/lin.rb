class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.28.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.28.0/lin-darwin-arm64.tar.gz"
      sha256 "ca13fbe6c77ae711ea1d348644794bf58f8e19132f7ca010ccf29058c9b46268"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.28.0/lin-darwin-amd64.tar.gz"
      sha256 "39971e0bb537ae438ac77a55b9e65b122fe99755051db748d38c202611c78978"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.28.0/lin-linux-arm64.tar.gz"
      sha256 "4bacbd2d7401993aab483d2328cea9a74832ade9db57987ed930e4ca1fd0ffa7"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.28.0/lin-linux-amd64.tar.gz"
      sha256 "57913d7451f1402f1a59e0becbd7409f829a87a3643ce829fab06617ac8c84aa"
    end
  end

  def install
    bin.install "lin"
    # Installs shell completions via `lin completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"lin", "completion")
  end

  test do
    assert_match "0.28.0", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI for humans and LLMs", shell_output("#{bin}/lin --help")
    assert_match "#compdef lin", shell_output("#{bin}/lin completion zsh")
  end
end
