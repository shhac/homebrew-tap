class Gt2gh < Formula
  desc "Bridge Graphite-managed linear stacks to GitHub native stacks"
  homepage "https://github.com/shhac/gt2gh"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/gt2gh/releases/download/v0.3.1/gt2gh-darwin-arm64.tar.gz"
      sha256 "bf29da9e2e369c7c1289d378c69ded9ac56678cc40f7fcde772b4749d6d58c74"
    end
    on_intel do
      url "https://github.com/shhac/gt2gh/releases/download/v0.3.1/gt2gh-darwin-amd64.tar.gz"
      sha256 "d06533dc96bc9c896469cc3f78ef240fa147252167f6c06e01676f48aef79f82"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/gt2gh/releases/download/v0.3.1/gt2gh-linux-arm64.tar.gz"
      sha256 "1953621bbe9e74511c50b1a3bdfdb8febba132e2c863ba0ddb58244a15be0c52"
    end
    on_intel do
      url "https://github.com/shhac/gt2gh/releases/download/v0.3.1/gt2gh-linux-amd64.tar.gz"
      sha256 "6289a450440f83ce8ca7b05421409a6b3bebd4a5b28c4e5e117091f812bf72b1"
    end
  end

  def install
    bin.install "gt2gh" => "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.3.1", shell_output("#{bin}/g2g --version")
    assert_match "Link a linear Graphite stack to GitHub", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
