class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.40.0/g2g-darwin-arm64.tar.gz"
      sha256 "7477fcff59f2f1605d8e8182fc22dfe54b29ba9f2f740f7dc642176af1d53dcc"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.40.0/g2g-darwin-amd64.tar.gz"
      sha256 "e2e16535b72a2f2318ef2fe1724faf1cdbe195bf6c5ac4078fd510f5bef9561f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.40.0/g2g-linux-arm64.tar.gz"
      sha256 "7bfc6813bd18c63b47f5053bc5d3e17c61f98820795ca39a4a0826eaade129d2"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.40.0/g2g-linux-amd64.tar.gz"
      sha256 "c6a0f65f0ee829f755ad0fbad84b148f0fcc7343f368452e7ad8a61c5e84938c"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.40.0", shell_output("#{bin}/g2g --version")
    assert_match "Manage stacked branches", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
