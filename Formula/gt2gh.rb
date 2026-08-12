class Gt2gh < Formula
  desc "Bridge Graphite-managed linear stacks to GitHub native stacks"
  homepage "https://github.com/shhac/gt2gh"
  version "0.3.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/gt2gh/releases/download/v0.3.3/gt2gh-darwin-arm64.tar.gz"
      sha256 "40d5e76bc1a32d933066c40ce001bb1e2b678d9bfd05ff0d915842faf3231174"
    end
    on_intel do
      url "https://github.com/shhac/gt2gh/releases/download/v0.3.3/gt2gh-darwin-amd64.tar.gz"
      sha256 "ce24a902d94490b98cf4927cfbfa16b9aef391476aa09f2ed2cb5ccd9fb2d196"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/gt2gh/releases/download/v0.3.3/gt2gh-linux-arm64.tar.gz"
      sha256 "5464eb668e565732871f1d8d84f6711bf31eb5b668127f33a76be5443a6cf4d3"
    end
    on_intel do
      url "https://github.com/shhac/gt2gh/releases/download/v0.3.3/gt2gh-linux-amd64.tar.gz"
      sha256 "9c041c65b39ec46cf021ed2ed3b9d74b426467364268fdd7cb40a813a5a2a162"
    end
  end

  def install
    bin.install "gt2gh" => "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.3.3", shell_output("#{bin}/g2g --version")
    assert_match "Link a linear Graphite stack to GitHub", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
