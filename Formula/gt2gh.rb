class Gt2gh < Formula
  desc "Bridge Graphite-managed linear stacks to GitHub native stacks"
  homepage "https://github.com/shhac/gt2gh"
  version "0.2.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/gt2gh/releases/download/v0.2.4/gt2gh-darwin-arm64.tar.gz"
      sha256 "0d64aeef15a4f4dd219f39644472464ae9243aa7c1b28bcaa83110125c60bc91"
    end
    on_intel do
      url "https://github.com/shhac/gt2gh/releases/download/v0.2.4/gt2gh-darwin-amd64.tar.gz"
      sha256 "a671fccdeb4393b7182529a2e7b7f0fc6b808cef135f4b2848644222d4b18160"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/gt2gh/releases/download/v0.2.4/gt2gh-linux-arm64.tar.gz"
      sha256 "45bf8cd3c90d5ab93c02a0581a91a7f5d25e036c1b22e0873c7384998e6fb0fb"
    end
    on_intel do
      url "https://github.com/shhac/gt2gh/releases/download/v0.2.4/gt2gh-linux-amd64.tar.gz"
      sha256 "50601b107dd16384f21947c48671561347db5d1485009f07ff86c45d570d6a9e"
    end
  end

  def install
    bin.install "gt2gh" => "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.2.4", shell_output("#{bin}/g2g --version")
    assert_match "Link a linear Graphite stack to GitHub", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
