class Gt2gh < Formula
  desc "Bridge Graphite-managed linear stacks to GitHub native stacks"
  homepage "https://github.com/shhac/gt2gh"
  version "0.3.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/gt2gh/releases/download/v0.3.2/gt2gh-darwin-arm64.tar.gz"
      sha256 "26259281134bc25ec5ae98cc39d12e22cc4464a499b882033a4d6e29166b9478"
    end
    on_intel do
      url "https://github.com/shhac/gt2gh/releases/download/v0.3.2/gt2gh-darwin-amd64.tar.gz"
      sha256 "089f2ae8483d2fb98bd01610f8038ea9fc14f580375c4034c46696fff9541663"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/gt2gh/releases/download/v0.3.2/gt2gh-linux-arm64.tar.gz"
      sha256 "efc6198be0303f86179547aab5dcc513062138ce20770ee0ce1911876bc83a01"
    end
    on_intel do
      url "https://github.com/shhac/gt2gh/releases/download/v0.3.2/gt2gh-linux-amd64.tar.gz"
      sha256 "4beb91773abd8d19300107ded71b0714153184b9cc6c55b582597d09479d62c3"
    end
  end

  def install
    bin.install "gt2gh" => "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.3.2", shell_output("#{bin}/g2g --version")
    assert_match "Link a linear Graphite stack to GitHub", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
