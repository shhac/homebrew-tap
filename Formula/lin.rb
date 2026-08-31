class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.36.4"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.36.4/lin-darwin-arm64.tar.gz"
      sha256 "ee83253fa0de67dc2831ca588ba8a7128e08e8612a6c164df15aca03371fd5ed"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.36.4/lin-darwin-amd64.tar.gz"
      sha256 "4daf05c5d6547080ad4916c03d267b3b133f726e759befba9dd89d0377589839"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.36.4/lin-linux-arm64.tar.gz"
      sha256 "6ef09c7c4eff2c5300fb4a2ce1361fc1514be0fbe7ac0f051bff4ced9074b7c9"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.36.4/lin-linux-amd64.tar.gz"
      sha256 "7c454cfd59826696bb6710f59a3398dc2fa9623532b5aa641704618afb34915c"
    end
  end

  def install
    bin.install "lin"
    # Installs shell completions via `lin completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"lin", "completion")
  end

  test do
    assert_match "0.36.4", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI for humans and LLMs", shell_output("#{bin}/lin --help")
    assert_match "#compdef lin", shell_output("#{bin}/lin completion zsh")
  end
end
