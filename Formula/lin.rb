class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.23.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.23.1/lin-darwin-arm64.tar.gz"
      sha256 "ef4c4cf6fbe8de946acfc62eb0c2e7889a6317a5998da194a8faa689522a5bbc"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.23.1/lin-darwin-amd64.tar.gz"
      sha256 "83041d555d963bcaaf48dbde5955954ea64c7fc50c7e801c8e602864b86c9bf5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.23.1/lin-linux-arm64.tar.gz"
      sha256 "30a573709ef5ce12d80b498870f2afc47ecd5a2023bf9b2a973cddb3455b0eb6"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.23.1/lin-linux-amd64.tar.gz"
      sha256 "64cd57c511ad23153bfacf5e69ee2280e21654721a79a2ee061bd52f7c75e99b"
    end
  end

  def install
    bin.install "lin"
    # Installs shell completions via `lin completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"lin", "completion")
  end

  test do
    assert_match "0.23.1", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI for humans and LLMs", shell_output("#{bin}/lin --help")
    assert_match "#compdef lin", shell_output("#{bin}/lin completion zsh")
  end
end
