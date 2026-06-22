class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.26.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.26.0/lin-darwin-arm64.tar.gz"
      sha256 "46f0057e2124264f905ffc07664552d13f7231ab90ec01b0222feb0f3f3661ee"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.26.0/lin-darwin-amd64.tar.gz"
      sha256 "bda96f626b99137d3dedb9f65817710b46d614697590484a2fb2dc08ea7a741a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.26.0/lin-linux-arm64.tar.gz"
      sha256 "ad828a79b70700fab56641d26db843674f114bf421739f5b5791c8c48df1462a"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.26.0/lin-linux-amd64.tar.gz"
      sha256 "a38c53ce63a48cf427d6171bf63396d2e9ca2cd21e71ec795b3f008de55c7f12"
    end
  end

  def install
    bin.install "lin"
    # Installs shell completions via `lin completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"lin", "completion")
  end

  test do
    assert_match "0.26.0", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI for humans and LLMs", shell_output("#{bin}/lin --help")
    assert_match "#compdef lin", shell_output("#{bin}/lin completion zsh")
  end
end
