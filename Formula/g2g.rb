class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.62.1/g2g-darwin-arm64.tar.gz"
      sha256 "91d4d863ce253206578c29b1974f6ba2e037ecf62363843cab04764db3066411"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.62.1/g2g-darwin-amd64.tar.gz"
      sha256 "175312b2efaef4b499dd92e72bd2e4270bba9f382799765d412abf600e236b86"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.62.1/g2g-linux-arm64.tar.gz"
      sha256 "72bfb93a336fa030d2359f5a2127e8258672dc4b1f9500e7240d99d85bd71181"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.62.1/g2g-linux-amd64.tar.gz"
      sha256 "ed33f680012bd389df49ad139532791a5c582b0b35e90938b69bf650429fc5b5"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.62.1", shell_output("#{bin}/g2g --version")
    assert_match "Manage stacked branches", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
