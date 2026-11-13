class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.37.0/lin-darwin-arm64.tar.gz"
      sha256 "f88e4fa2385bf32135b3a7c842ff7019cfd674e248dfb99517611f2164b9e911"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.37.0/lin-darwin-amd64.tar.gz"
      sha256 "ecc0d95c24fcfc9e675639eabcefae2c8262d8d04ed79a4f224144f838869ba2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.37.0/lin-linux-arm64.tar.gz"
      sha256 "17014556ec926607fd225c1ec0e7be25756121aa032a5cf17b2386b3f73d17da"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.37.0/lin-linux-amd64.tar.gz"
      sha256 "9cdcc37af66273ba610d73c82b7f105118aedf51c49a2dcc52fcf021ab8b25f5"
    end
  end

  def install
    bin.install "lin"
    # Installs shell completions via `lin completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"lin", "completion")
  end

  test do
    assert_match "0.37.0", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI for humans and LLMs", shell_output("#{bin}/lin --help")
    assert_match "#compdef lin", shell_output("#{bin}/lin completion zsh")
  end
end
