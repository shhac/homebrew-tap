class Gt2gh < Formula
  desc "Bridge Graphite-managed linear stacks to GitHub native stacks"
  homepage "https://github.com/shhac/gt2gh"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/gt2gh/releases/download/v0.5.0/gt2gh-darwin-arm64.tar.gz"
      sha256 "4a05ed28e2ccdef75e5167b978b6b813dcf597bfa8283bc3b7a4aab1910561a9"
    end
    on_intel do
      url "https://github.com/shhac/gt2gh/releases/download/v0.5.0/gt2gh-darwin-amd64.tar.gz"
      sha256 "8c8658c7276791375e8c382f5f9a838e5dba30b97344fd4c3633accaa88d4d9d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/gt2gh/releases/download/v0.5.0/gt2gh-linux-arm64.tar.gz"
      sha256 "b7505addc5c15778e81f35eb0e4f9bc88944fab4d9f383a555f82acabe563a68"
    end
    on_intel do
      url "https://github.com/shhac/gt2gh/releases/download/v0.5.0/gt2gh-linux-amd64.tar.gz"
      sha256 "85d1dc49a9b96c24bad4958047b2af23ee68bb567e48dc0072db87114ea86d69"
    end
  end

  def install
    bin.install "gt2gh" => "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.5.0", shell_output("#{bin}/g2g --version")
    assert_match "Link a linear Graphite stack to GitHub", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
