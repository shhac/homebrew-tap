class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.33.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.33.0/lin-darwin-arm64.tar.gz"
      sha256 "a8d5e64550cc4a656914f63bbfa13d393ab4926337848a29ce9da79410645e00"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.33.0/lin-darwin-amd64.tar.gz"
      sha256 "0053c058f0e5c3bb0c0488c4e03d90f73fa3ef67017aca467eb2cafe02f81be0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.33.0/lin-linux-arm64.tar.gz"
      sha256 "0661180636fb74eb289e7588260926bf23065e443b3a4748099ebfb5ca8754a1"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.33.0/lin-linux-amd64.tar.gz"
      sha256 "411c1a97a0cb0be0ee273318858afaebbeeb517c624dc3fdd479887a2568fdf3"
    end
  end

  def install
    bin.install "lin"
    # Installs shell completions via `lin completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"lin", "completion")
  end

  test do
    assert_match "0.33.0", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI for humans and LLMs", shell_output("#{bin}/lin --help")
    assert_match "#compdef lin", shell_output("#{bin}/lin completion zsh")
  end
end
