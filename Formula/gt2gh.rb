class Gt2gh < Formula
  desc "Bridge Graphite-managed linear stacks to GitHub native stacks"
  homepage "https://github.com/shhac/gt2gh"
  version "0.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/gt2gh/releases/download/v0.2.2/gt2gh-darwin-arm64.tar.gz"
      sha256 "b9f5214b6c1d3f69eec3b350fc084904da443ed99e1eac778093e5dbd1ef6db2"
    end
    on_intel do
      url "https://github.com/shhac/gt2gh/releases/download/v0.2.2/gt2gh-darwin-amd64.tar.gz"
      sha256 "cfd92d6b3442dd4a9780d3a9d6a91d9587119422f85f04414033f327f7896ddd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/gt2gh/releases/download/v0.2.2/gt2gh-linux-arm64.tar.gz"
      sha256 "13b34eda44348adc850f9492d844de8d186b71b615c91c9a72e2d9ab2e1751e4"
    end
    on_intel do
      url "https://github.com/shhac/gt2gh/releases/download/v0.2.2/gt2gh-linux-amd64.tar.gz"
      sha256 "3e896f1700e96d07d9105780177f70949ecb6f7110b13533bf9d761fbacbe7c4"
    end
  end

  def install
    bin.install "gt2gh" => "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.2.2", shell_output("#{bin}/g2g --version")
    assert_match "Link a linear Graphite stack to GitHub", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
