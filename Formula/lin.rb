class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.38.0/lin-darwin-arm64.tar.gz"
      sha256 "d7f5923b98afddba30567737555f84cf5de22e4e402203c368433d8afe8062b6"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.38.0/lin-darwin-amd64.tar.gz"
      sha256 "4dce140c1a7c256ff8f591c53d39e785fbd1240b8d6e0255578ca1813e26d00c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.38.0/lin-linux-arm64.tar.gz"
      sha256 "f6a533ff5108bc2bf44429cf2da167ef39c1fc421e9ab77c910f8b2cb0fab068"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.38.0/lin-linux-amd64.tar.gz"
      sha256 "a76cf5da4717399463880ce5c0102008256223db99e21f046d0083907fec8e67"
    end
  end

  def install
    bin.install "lin"
    # Installs shell completions via `lin completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"lin", "completion")
  end

  test do
    assert_match "0.38.0", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI for humans and LLMs", shell_output("#{bin}/lin --help")
    assert_match "#compdef lin", shell_output("#{bin}/lin completion zsh")
  end
end
