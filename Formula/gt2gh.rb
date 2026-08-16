class Gt2gh < Formula
  desc "Bridge Graphite-managed linear stacks to GitHub native stacks"
  homepage "https://github.com/shhac/gt2gh"
  version "0.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/gt2gh/releases/download/v0.11.0/gt2gh-darwin-arm64.tar.gz"
      sha256 "6bf2334c70287ba08ef8344d26d383c0d026057406bc5cb7e6e20ee2481aa43d"
    end
    on_intel do
      url "https://github.com/shhac/gt2gh/releases/download/v0.11.0/gt2gh-darwin-amd64.tar.gz"
      sha256 "be09e9ad132db572c0a65470a7e4cef71d8ddb4bbfbcd117290cc6530c2a27b1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/gt2gh/releases/download/v0.11.0/gt2gh-linux-arm64.tar.gz"
      sha256 "48539bc0586bbdf1c4c92dc551e16c155962f2937dfee0bb61696cb6dd3eace7"
    end
    on_intel do
      url "https://github.com/shhac/gt2gh/releases/download/v0.11.0/gt2gh-linux-amd64.tar.gz"
      sha256 "34151bef1d25a84496125e777b4aaadf96f44e00f82190e42e50cbb4c05f1f5a"
    end
  end

  def install
    bin.install "gt2gh" => "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.11.0", shell_output("#{bin}/g2g --version")
    assert_match "Link a linear Graphite stack to GitHub", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
