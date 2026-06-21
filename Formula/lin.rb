class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.21.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.21.0/lin-darwin-arm64.tar.gz"
      sha256 "8f83b8e112ae895d61ec7425e8c17c7584ad522ce3fdc855ba562dce88ef44df"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.21.0/lin-darwin-amd64.tar.gz"
      sha256 "c13f1481fcba931968f660a3a8ad610a0896a561fa329f75e74aae7244d3996b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.21.0/lin-linux-arm64.tar.gz"
      sha256 "3385c35d156ca111f13fedfe401922d28a38add7d1f1264742b2a1e517ce4dbc"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.21.0/lin-linux-amd64.tar.gz"
      sha256 "261634fb29a4a85482b763b3a5ad9508ca08222ceefa1d164f8e31170e1966ec"
    end
  end

  def install
    bin.install Dir["lin*"].first => "lin"
    # Installs shell completions via `lin completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"lin", "completion")
  end

  test do
    assert_match "0.21.0", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI", shell_output("#{bin}/lin --help")
  end
end
