class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.27.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.27.1/lin-darwin-arm64.tar.gz"
      sha256 "4c80161b96514bd47915cb94086ad5b64ab0118f6c253d9901259b94c3a6d533"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.27.1/lin-darwin-amd64.tar.gz"
      sha256 "5b4ef0629310972844f43fcbbff02e775c438e2060aae5da18b7e60597f116d2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.27.1/lin-linux-arm64.tar.gz"
      sha256 "3ebb3df78290fb85ce72d44f6e891efae5066e8502d60577e38f47725e792aa4"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.27.1/lin-linux-amd64.tar.gz"
      sha256 "4c5a3584bb767ca32835803ec73e59464834f745206c93248c698f65a3b5d1a8"
    end
  end

  def install
    bin.install "lin"
    # Installs shell completions via `lin completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"lin", "completion")
  end

  test do
    assert_match "0.27.1", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI for humans and LLMs", shell_output("#{bin}/lin --help")
    assert_match "#compdef lin", shell_output("#{bin}/lin completion zsh")
  end
end
