class Gt2gh < Formula
  desc "Bridge Graphite-managed linear stacks to GitHub native stacks"
  homepage "https://github.com/shhac/gt2gh"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/gt2gh/releases/download/v0.3.0/gt2gh-darwin-arm64.tar.gz"
      sha256 "92415e67b786b892f38bfb0590ad46b6379c5f53d28d39bc8029ae790f9fdce1"
    end
    on_intel do
      url "https://github.com/shhac/gt2gh/releases/download/v0.3.0/gt2gh-darwin-amd64.tar.gz"
      sha256 "fa872180c4bb7f46a828ef77fd56b356c284bba0b14131862708461ac2149c91"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/gt2gh/releases/download/v0.3.0/gt2gh-linux-arm64.tar.gz"
      sha256 "18b17177b90605d35d7bf98641faffd64a17e7a1b0b5e455962ce5569ba0f3fc"
    end
    on_intel do
      url "https://github.com/shhac/gt2gh/releases/download/v0.3.0/gt2gh-linux-amd64.tar.gz"
      sha256 "72864931aa2387614f3650506e4944c042615a969455cf7e2f17508ebc0af050"
    end
  end

  def install
    bin.install "gt2gh" => "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.3.0", shell_output("#{bin}/g2g --version")
    assert_match "Link a linear Graphite stack to GitHub", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
