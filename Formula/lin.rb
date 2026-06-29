class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.34.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.34.1/lin-darwin-arm64.tar.gz"
      sha256 "657993da5716597fbc458ea64e39bb5578ce8cff439a7b472a4ce8f2e1522df8"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.34.1/lin-darwin-amd64.tar.gz"
      sha256 "540678e4e02e80fc16f86aa9f1ad8484cc78fe1d683540beaf523318de4ab272"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.34.1/lin-linux-arm64.tar.gz"
      sha256 "a2f7265907699087b2758cb3bbf93cb5fd27d5d9e3976e2a0c7835cb4404a099"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.34.1/lin-linux-amd64.tar.gz"
      sha256 "b268edf4f934286642c42f76b3a1d3332aa774bf0826295c71c0b0988f5a8834"
    end
  end

  def install
    bin.install "lin"
    # Installs shell completions via `lin completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"lin", "completion")
  end

  test do
    assert_match "0.34.1", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI for humans and LLMs", shell_output("#{bin}/lin --help")
    assert_match "#compdef lin", shell_output("#{bin}/lin completion zsh")
  end
end
