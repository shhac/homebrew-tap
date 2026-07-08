class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.36.2"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.36.2/lin-darwin-arm64.tar.gz"
      sha256 "09b45b67d6a437e64d8f09d41e2db1566e252160bb6422bd6756923076f8a18d"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.36.2/lin-darwin-amd64.tar.gz"
      sha256 "6933175c6b8af4a8424fe33916c6ab4822029be8f150458f95fb4aae8af9e5c5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.36.2/lin-linux-arm64.tar.gz"
      sha256 "c64edab6e0e9097f02566db910445f4337dfb6067d16aa537786d477e5be8ba0"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.36.2/lin-linux-amd64.tar.gz"
      sha256 "2044fd81eaf02781a1fb82ee8acd67f98ee116c28feda9bb28ac4bb651d7b3a8"
    end
  end

  def install
    bin.install "lin"
    # Installs shell completions via `lin completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"lin", "completion")
  end

  test do
    assert_match "0.36.2", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI for humans and LLMs", shell_output("#{bin}/lin --help")
    assert_match "#compdef lin", shell_output("#{bin}/lin completion zsh")
  end
end
