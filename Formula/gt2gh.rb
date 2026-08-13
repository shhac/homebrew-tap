class Gt2gh < Formula
  desc "Bridge Graphite-managed linear stacks to GitHub native stacks"
  homepage "https://github.com/shhac/gt2gh"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/gt2gh/releases/download/v0.6.0/gt2gh-darwin-arm64.tar.gz"
      sha256 "f4ac4758e7c67ca9d649b0c8f3d85c486e8fed805abd3396b96130cad353ecd5"
    end
    on_intel do
      url "https://github.com/shhac/gt2gh/releases/download/v0.6.0/gt2gh-darwin-amd64.tar.gz"
      sha256 "0cf2e5068070a2a002f34dae8d16da4f76d7b1dc5f28265897f9e9877969ac4b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/gt2gh/releases/download/v0.6.0/gt2gh-linux-arm64.tar.gz"
      sha256 "1182fa6673fc7c0fccb92ce869c7da5600125440ddeeab8f5b29dc7463ecf46b"
    end
    on_intel do
      url "https://github.com/shhac/gt2gh/releases/download/v0.6.0/gt2gh-linux-amd64.tar.gz"
      sha256 "51fa0b5e7e957381e45ec390373dd330bc16c3afaae9751da75efb6ed0d0afa1"
    end
  end

  def install
    bin.install "gt2gh" => "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.6.0", shell_output("#{bin}/g2g --version")
    assert_match "Link a linear Graphite stack to GitHub", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
