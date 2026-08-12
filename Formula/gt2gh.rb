class Gt2gh < Formula
  desc "Bridge Graphite-managed linear stacks to GitHub native stacks"
  homepage "https://github.com/shhac/gt2gh"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/gt2gh/releases/download/v0.2.0/gt2gh-darwin-arm64.tar.gz"
      sha256 "83dff788b29c1188b3b2918670ba88129c8ee0172a92ffa63f1190cd39f44a1a"
    end
    on_intel do
      url "https://github.com/shhac/gt2gh/releases/download/v0.2.0/gt2gh-darwin-amd64.tar.gz"
      sha256 "d2eb7dac86ea815976c319466b833a53a5041b7aa820264bb9b62ac2b2725b90"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/gt2gh/releases/download/v0.2.0/gt2gh-linux-arm64.tar.gz"
      sha256 "99b58a983cda1f30901fbce3996bd2f23c81db85ac4779818a612f7619c98987"
    end
    on_intel do
      url "https://github.com/shhac/gt2gh/releases/download/v0.2.0/gt2gh-linux-amd64.tar.gz"
      sha256 "aeab5d63b38e7b287797832bccc1a7ccd6c3e9c35918192f75c6300bfd033ce8"
    end
  end

  def install
    bin.install "gt2gh"
    # Installs shell completions via `gt2gh completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"gt2gh", "completion")
  end

  test do
    assert_match "0.2.0", shell_output("#{bin}/gt2gh --version")
    assert_match "Link a linear Graphite stack to GitHub", shell_output("#{bin}/gt2gh --help")
    assert_match "#compdef gt2gh", shell_output("#{bin}/gt2gh completion zsh")
  end
end
