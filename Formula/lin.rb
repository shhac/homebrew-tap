class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.35.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.35.0/lin-darwin-arm64.tar.gz"
      sha256 "2e858e842aaa8e0ddc5e0df134c28f32514bebd1a6f41584e3d3b931165b0aa7"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.35.0/lin-darwin-amd64.tar.gz"
      sha256 "4001e94394a6e0be8e8cb9c8588cc294f701f8f57116328a064a9f1f6c154f11"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.35.0/lin-linux-arm64.tar.gz"
      sha256 "c50dbb21c9b936a1b813f3b5ad379368f1710720019f461f8f15e99536b42906"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.35.0/lin-linux-amd64.tar.gz"
      sha256 "b46cbffcd23f5a8fb1c667f99d9683156bcdab5b13be2d669713f8e2ff8ad53a"
    end
  end

  def install
    bin.install "lin"
    # Installs shell completions via `lin completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"lin", "completion")
  end

  test do
    assert_match "0.35.0", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI for humans and LLMs", shell_output("#{bin}/lin --help")
    assert_match "#compdef lin", shell_output("#{bin}/lin completion zsh")
  end
end
