class Gt2gh < Formula
  desc "Bridge Graphite-managed linear stacks to GitHub native stacks"
  homepage "https://github.com/shhac/gt2gh"
  version "0.2.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/gt2gh/releases/download/v0.2.3/gt2gh-darwin-arm64.tar.gz"
      sha256 "cce77cde322fcb863543934cbcffbda7d2b7ec468c1da237251752869259e4b7"
    end
    on_intel do
      url "https://github.com/shhac/gt2gh/releases/download/v0.2.3/gt2gh-darwin-amd64.tar.gz"
      sha256 "bc930c529591ef58ca2f568a30b03d3f62be64a6572678f518479b5bca60830a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/gt2gh/releases/download/v0.2.3/gt2gh-linux-arm64.tar.gz"
      sha256 "0a3b14c2abf002c7a80bffaf68895464815df4fcc3d397d7e33a3a8d8acc809d"
    end
    on_intel do
      url "https://github.com/shhac/gt2gh/releases/download/v0.2.3/gt2gh-linux-amd64.tar.gz"
      sha256 "d6a927b95546fe944484aa2ad3ac5fb760e4d2a10c89a2e2f90e503f2b4b3ec9"
    end
  end

  def install
    bin.install "gt2gh" => "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.2.3", shell_output("#{bin}/g2g --version")
    assert_match "Link a linear Graphite stack to GitHub", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
