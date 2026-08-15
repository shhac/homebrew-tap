class Gt2gh < Formula
  desc "Bridge Graphite-managed linear stacks to GitHub native stacks"
  homepage "https://github.com/shhac/gt2gh"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/gt2gh/releases/download/v0.8.0/gt2gh-darwin-arm64.tar.gz"
      sha256 "d1c980208bafcda52ba437ba0003e6a0848e0270d0cf8623ed44de037a1d04e9"
    end
    on_intel do
      url "https://github.com/shhac/gt2gh/releases/download/v0.8.0/gt2gh-darwin-amd64.tar.gz"
      sha256 "20bbde74faffb57bbaf8d3ab00eb119066887d9accc23d5b48b048e85bca76d1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/gt2gh/releases/download/v0.8.0/gt2gh-linux-arm64.tar.gz"
      sha256 "6215a4fc7a940fd2f51519e698eb6fd4ad85e4a19e959d0a1e8ffc2124694644"
    end
    on_intel do
      url "https://github.com/shhac/gt2gh/releases/download/v0.8.0/gt2gh-linux-amd64.tar.gz"
      sha256 "301a32b3eafc8ad22f72f6693c29ae6357e348c703455f706d32ec51a2bea2a8"
    end
  end

  def install
    bin.install "gt2gh" => "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.8.0", shell_output("#{bin}/g2g --version")
    assert_match "Link a linear Graphite stack to GitHub", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
