class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.27.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.27.0/lin-darwin-arm64.tar.gz"
      sha256 "8b2e4b8fdcc85f4785d3fb04401f9b65e6e46ea529cf80d153f443989feb87f4"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.27.0/lin-darwin-amd64.tar.gz"
      sha256 "91e2bd8ae93c0f03839add4164762475a94793014d5907f08cbe1a09d0b1aa54"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.27.0/lin-linux-arm64.tar.gz"
      sha256 "add0c2c45cd8a16bf7af1cc242f337914234f0fba96065cb53b402896abc85a3"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.27.0/lin-linux-amd64.tar.gz"
      sha256 "87b446edd4d5ca8a859760cb7a94522a816c0ba739507382fccfac1e8bc6c93f"
    end
  end

  def install
    bin.install "lin"
    # Installs shell completions via `lin completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"lin", "completion")
  end

  test do
    assert_match "0.27.0", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI for humans and LLMs", shell_output("#{bin}/lin --help")
    assert_match "#compdef lin", shell_output("#{bin}/lin completion zsh")
  end
end
