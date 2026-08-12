class Gt2gh < Formula
  desc "Bridge Graphite-managed linear stacks to GitHub native stacks"
  homepage "https://github.com/shhac/gt2gh"
  version "0.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/gt2gh/releases/download/v0.4.1/gt2gh-darwin-arm64.tar.gz"
      sha256 "249c2eab016269b3fcbe21ce151612009fd292f94edb2e8c55321624e630b539"
    end
    on_intel do
      url "https://github.com/shhac/gt2gh/releases/download/v0.4.1/gt2gh-darwin-amd64.tar.gz"
      sha256 "e5c6d6c83111545f696226f1e4235fc26ae9df8e095bb7ad06281b1269ae7e2a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/gt2gh/releases/download/v0.4.1/gt2gh-linux-arm64.tar.gz"
      sha256 "c4bb9ede5728fd01ae9511db83fd34a4a35fe01cf95d4a2663584c00b647cc1b"
    end
    on_intel do
      url "https://github.com/shhac/gt2gh/releases/download/v0.4.1/gt2gh-linux-amd64.tar.gz"
      sha256 "84c77d9403448a441529b79915074d258c0e70a9b8fb1d69bffcb337f7317762"
    end
  end

  def install
    bin.install "gt2gh" => "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.4.1", shell_output("#{bin}/g2g --version")
    assert_match "Link a linear Graphite stack to GitHub", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
