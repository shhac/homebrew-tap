class Gt2gh < Formula
  desc "Bridge Graphite-managed linear stacks to GitHub native stacks"
  homepage "https://github.com/shhac/gt2gh"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/gt2gh/releases/download/v0.2.1/gt2gh-darwin-arm64.tar.gz"
      sha256 "ff92139a5ff24733805ea377b328e7835a67c63d20b8dd68eae4a228ccefc2ac"
    end
    on_intel do
      url "https://github.com/shhac/gt2gh/releases/download/v0.2.1/gt2gh-darwin-amd64.tar.gz"
      sha256 "ad02a778d4f64e3c4ae454b7d8d7241a3259b978c897be316ef237f6cfe099dd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/gt2gh/releases/download/v0.2.1/gt2gh-linux-arm64.tar.gz"
      sha256 "19798a75354de3a75b0c94d941eddfa9c6615832dd77a9df8986d92c0c8f6448"
    end
    on_intel do
      url "https://github.com/shhac/gt2gh/releases/download/v0.2.1/gt2gh-linux-amd64.tar.gz"
      sha256 "6769662f3ac7bf8cb625c04797443dae6130c456b412b358ec8b2c1d537b2478"
    end
  end

  def install
    bin.install "gt2gh" => "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.2.1", shell_output("#{bin}/g2g --version")
    assert_match "Link a linear Graphite stack to GitHub", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
