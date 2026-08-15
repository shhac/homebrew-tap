class Gt2gh < Formula
  desc "Bridge Graphite-managed linear stacks to GitHub native stacks"
  homepage "https://github.com/shhac/gt2gh"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/gt2gh/releases/download/v0.9.0/gt2gh-darwin-arm64.tar.gz"
      sha256 "179b0f9136db8cc2b625a4ab4e6a6f4521997151fa308aadc0facf2c8fb0d6cb"
    end
    on_intel do
      url "https://github.com/shhac/gt2gh/releases/download/v0.9.0/gt2gh-darwin-amd64.tar.gz"
      sha256 "f7b900aae0205c9eebce72af68919edb76c0760619d0edc0b3153d7784cd755e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/gt2gh/releases/download/v0.9.0/gt2gh-linux-arm64.tar.gz"
      sha256 "50a449a38affd766ec8dedd73e76aa229c16cae572f953ef1c04fc9664401f8f"
    end
    on_intel do
      url "https://github.com/shhac/gt2gh/releases/download/v0.9.0/gt2gh-linux-amd64.tar.gz"
      sha256 "6437619d4947b1c5d9377dac13239f5ddd8cc6a3611f20dafcfb91b4d635014b"
    end
  end

  def install
    bin.install "gt2gh" => "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.9.0", shell_output("#{bin}/g2g --version")
    assert_match "Link a linear Graphite stack to GitHub", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
