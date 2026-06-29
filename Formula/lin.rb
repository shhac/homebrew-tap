class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.34.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.34.0/lin-darwin-arm64.tar.gz"
      sha256 "928c94cfab6bf6254ec64b6200b154606d0f706b2d0a4096701c116fabcf99db"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.34.0/lin-darwin-amd64.tar.gz"
      sha256 "cbf1157ec49cd574efd896c1f97ba678ce3c50a9d8246888981bb32d11fec15e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.34.0/lin-linux-arm64.tar.gz"
      sha256 "eba5aca6e5e622ac4876ce8eab161b65463e2f489f944fc5ec8dbcfd9c0515c3"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.34.0/lin-linux-amd64.tar.gz"
      sha256 "45344d385407388b6ced4fadc9daf295bd33d599028898f8f89974eb96776e1d"
    end
  end

  def install
    bin.install "lin"
    # Installs shell completions via `lin completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"lin", "completion")
  end

  test do
    assert_match "0.34.0", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI for humans and LLMs", shell_output("#{bin}/lin --help")
    assert_match "#compdef lin", shell_output("#{bin}/lin completion zsh")
  end
end
