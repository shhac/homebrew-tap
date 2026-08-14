class Gt2gh < Formula
  desc "Bridge Graphite-managed linear stacks to GitHub native stacks"
  homepage "https://github.com/shhac/gt2gh"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/gt2gh/releases/download/v0.7.0/gt2gh-darwin-arm64.tar.gz"
      sha256 "c44c86583b4e20ec6bf8ff1b925cb11fe59dca793d3f594c815d8573db6dee3c"
    end
    on_intel do
      url "https://github.com/shhac/gt2gh/releases/download/v0.7.0/gt2gh-darwin-amd64.tar.gz"
      sha256 "1b9ff0a480ae8c35e1fa77d5c94616f296fd614d6f63cb3b589c15e5012759a6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/gt2gh/releases/download/v0.7.0/gt2gh-linux-arm64.tar.gz"
      sha256 "d8b9dbc405bba0e0cf2f0c7f8bc03e8d13890ae1a1974ab8879220916e04c876"
    end
    on_intel do
      url "https://github.com/shhac/gt2gh/releases/download/v0.7.0/gt2gh-linux-amd64.tar.gz"
      sha256 "36ca9d7e18c7aca6662b482772730866df6d5eb0e270aaaeb5734b19ff3f375c"
    end
  end

  def install
    bin.install "gt2gh" => "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.7.0", shell_output("#{bin}/g2g --version")
    assert_match "Link a linear Graphite stack to GitHub", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
